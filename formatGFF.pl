#!/usr/bin/perl
# WRITTEN BY GAMALIEL LOPEZ-LEAL
# This program add exone line in the gff prokka file. This program was written for the UAEM workshops
#usage: perl script.pl PROKKA-file.gff
use strict;
#---------------------------------------------------------------VARIABLES----------------------------------------------------------------------------
my $GFF;
my $line;
my ($locus, $tool, $CDS, $start, $end, $chr, $strand, $number, $attribute);
#---------------------------------------------------------------------CODE--------------------------------------------------------------------------------------
$GFF = $ARGV[0];

open (GFF, "$GFF") or print "can't open file $GFF\n";
while (<GFF>){ 
      $line=$_;
      chomp $line;
      print "$line\n" if $line =~ /^##g/ or $line =~ /^##s/;
      if ($line !~ /^#/){
         ($locus, $tool, $CDS, $start, $end, $chr, $strand, $number, $attribute) = split /\t/, $line;
         $attribute =~ s/^ID=/gene_id=/;
         $CDS =~ s/^CDS/gene/;
         print "$locus\t$tool\t$CDS\t$start\t$end\t$chr\t$strand\t$number\t$attribute\n";
         print "$locus\t$tool\texon\t$start\t$end\t$chr\t$strand\t$number\t$attribute\n";
      }#end if   
      goto END if $line =~ /^##FASTA/;
                 
}#fin del while

END: close GFF;