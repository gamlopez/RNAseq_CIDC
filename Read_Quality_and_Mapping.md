## Quality controls

First you have to remove sequencing adapters and  those reads which have poor quality, before downstream analysis. To do this, you want to use TRIM_GALORE (https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/).

To display  the menu:

```
trim_galore --help
```

 Run TRIM_GALORE using some default parameters.

```
trim_galore --fastqc --paired --retain_unpaired R1.fastq R2.fastq 
```

If you want to look the results using strigment quality criteria you can use the `-q/—quality` option and or

 `--length_1` y `--length_2` creating a new output directory

```
trim_galore --paired --retain_unpaired --length_1 40 R1.fastq R2.fastq  --output_dir  OutDir_paired_40
```



## **Read Mapping**

Create a new work directory using `mkdir` named as **ReadMapping**  First, you need to format the reference genome with the command `bowtie2-build`. To display the menu use the option `--help` 

```
bowtie2-build --help
```

Formatting the reference genome.

```
bowtie2-build reference.fa REF
```

Mapping quality reads.

```
bowtie2 --no-unal -x REF -1 QualityReads_R1.fastq -2 QualityReads_R2.fastq -S outFile.sam
```

You can use the options  `--sensitive` and `--very sensitive` to use strigment criteria.

The file  outFile.sam contains only the mapped reads because we used the option `--no-unal`.

You can use the `grep -c` option to count the mapped reads or converter the sam file in a .bam  file (binary) to count the mapped using the -F 0x04 or -F 4 flag

```
samtools view -bSo MappedReads.bam MappedReads.sam
samtools sort MappedReads.bam -o MappedReads_SORTED.bam
samtools view -F 0x04 -c MappedReads_SORTED.bam
samtools index MappedReads_SORTED.bam
samtools view -h -o MappedReads_SORTED.sam MappedReads_SORTED.bam
```



# Read Count

An important aspect in RNA-Seq analyzes is to incorporate in a table the number of reads mapped for each gene. For this, we fisrt we have to perform a gene calling and annotation of the reference genome. This time we are going to use pharokka (https://github.com/tseemann/prokka)

##### PROKKA

```
cd $HOME
cp .bashrc.conda .bashrc
#salir de la sesión y volver a entrar
conda activate pharokka_env
pharokka ReferenceGenome.fna
```

##### PHAROKKA Output Files

| Extension | Description                              |
| --------- | ---------------------------------------- |
| .gff      | This is the master annotation in GFF3 format, containing both sequences and annotations. It can be viewed directly in Artemis or IGV. |
| .gbk      | This is a standard Genbank file derived from the master .gff. If the input to prokka was a multi-FASTA, then this will be a multi-Genbank, with one record for each sequence. |
| .fna      | Nucleotide FASTA file of the input contig sequences. |
| .faa      | Protein FASTA file of the translated CDS sequences. |
| .ffn      | Nucleotide FASTA file of all the prediction transcripts (CDS, rRNA, tRNA, tmRNA, misc_RNA) |
| .sqn      | An ASN1 format "Sequin" file for submission to Genbank. It needs to be edited to set the correct taxonomy, authors, related publication etc. |
| .fsa      | Nucleotide FASTA file of the input contig sequences, used by "tbl2asn" to create the .sqn file. It is mostly the same as the .fna file, but with extra Sequin tags in the sequence description lines. |
| .tbl      | Feature Table file, used by "tbl2asn" to create the .sqn file. |
| .err      | Unacceptable annotations - the NCBI discrepancy report. |
| .log      | Contains all the output that Prokka produced during its run. This is a record of what settings you used, even if the --quiet option was enabled. |
| .txt      | Statistics relating to the annotated features found. |
| .tsv      | Tab-separated file of all features: locus_tag,ftype,len_bp,gene,EC_number,COG,product |

##### Vizualize the reads using Artemis and analyzed the read count

Open in Artemis your reference annotated genome ( .gbk files from NCBI) and load mapped reads.

```
File -> Read BAM / VCF option
Select -> Select CDS Features ->  click on the pink region and select the option Analyzed Read Count 
```

##### Read Count using HTSeq

If you are working with a very large dataset (mouse genome) we recommend using HTSeq (https://github.com/htseq). Before use HTSeq, the prokka .gff file need to be formatted using the script `formatGFF.pl`

```
perl formatGFF.pl PROKKA.gff > new-formatted_prokka.gff
```

run `htseq-count`

```
/usr/local/bin/htseq-count -m union -a 2 -s no --idattr=gene_id aln-28a-SORTED.sam new-formatted_prokka.gff -o COUNTS > Counts-28a.txt
```



