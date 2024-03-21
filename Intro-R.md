# Introducción a R

#### Gamaliel López-Leal

###### Laboratorio de Biología Computacional y Virómica Integrativa

###### Centro de Investigación en Dinámica Celular-UAEM

gamaliel.lopez@uaem.edu.mx	



### Inciar R

Para empezar, por favor, crea un directorio con linea de comandos, (usando la el comando `mkdir`) llamado `IntroductionR`, y luego entra en él:

```
mkdir IntroductionR
cd IntroductionR
```

Para abrir un terminal R, escriba R y pulse "enter".  Recomendamos encarecidamente utilizar R en un directorio de trabajo diferente para cada proyecto. Puede comprobar el directorio de trabajo que está utilizando con el comando `getwd()`.  Para el desarrollo de este taller utilizaremos el siguiente directorio de trabajo:

/home/usuarios/su_identificación/IntroducciónR

Si desea cambiar el directorio de trabajo, puede utilizar el comando `setwd()` de la siguiente manera

`setwd('/nuevodirectorio')`	

Para enlistar los archivos en tu directorio de trabajo en linux usa el comando `list.files()` ó `ls()` para ver los objetos creados en la sesión de R

```
list.files()
```

​	
​		

### Tipos de datos

En R puedes crear diferentes objetos de distintos tipos de datos (vectores, matrices, data frames, funciones, listas, etc...). Para listar las entidades creadas durante una sesión de R, se pueden utilizar los comandos `ls()` u `objects()`. Todos los objetos creados en un entorno determinado pueden guardarse después de finalizar cada sesión de R respondiendo y cuando se pide guardar la imagen del espacio de trabajo o utilizando el comando `save.image()`. Los datos se guardarán en un fichero con extensión .RData.

Para eliminar un objeto se puede utilizar el comando de R `rm()`:

```
rm(nombre-objeto1,nombre-objeto2, ..., nombre-objeto-n)
```

### Vectores

El tipo de datos más simple en R son los vectores, son una colección de elementos, todos ellos del mismo tipo. 

Vectores numéricos: Vectores compuestos por números. Con este tipo de vectores se pueden realizar cálculos aritméticos

```
vector_numerico <- c(38, 66, 12, 105, 2, 17)
```

También puedes crear vectores numéricos generando secuencias o repeticiones.			

```
#Generar una secuencia regular en orden ascendente de 1 a 30 incrementando en 2
sequence_vector <- seq(1,30, by = 2)
sequence_vector
[1]  1  3  5  7  9 11 13 15 17 19 21 23 25 27 29


#Generar un vector de veinte de longitud 10 (parámetro: times)
rep_constant<-rep(20, times=10)
rep_constant
[1] 20 20 20 20 20 20 20 20 20 20

#Generar un vector de tres veces vector_numerico (parámetro:times)
rep_numvector <- rep(vector_numerico, times = 3)
rep_numvector
[1]  38  66  12 105   2  17  38  66  12 105   2  17  38  66  12 105   2  17

#Generar un vector repitiendo todos los elementos de vector_numerico tres veces cada uno (parámetro: each)
rep_each_numvector<-rep(vector_numerico, each = 3)
rep_each_numvector
[1]  38  38  38  66  66  66  12  12  12 105 105 105   2   2   2  17  17  17
```

### Operadores aritméticos

Para sumar, restar, multiplicar o dividir un valor constante a todos los elementos de un vector.		
​				

```
#Addition
add_constant <- vector_numerico + 3
add_constant
[1]  41  69  15 108   5  20

#Subtraction
sub_constant<- vector_numerico - 3
sub_constant
[1]  35  63   9 102  -1  14

#Multiplication
mult_constant<- vector_numerico * 3
mult_constant
[1] 114 198  36 315   6  51

#Division
div_constant <- vector_numerico / 3
div_constant
[1] 12.6666667 22.0000000  4.0000000 35.0000000  0.6666667  5.6666667


# Let's create another vector
num_vector1 <-  c(6,5,4,3,2,1)

#Addition
add_vectors <- vector_numerico + num_vector1
add_vectors
[1]  44  71  16 108   4  18

#Subtraction
sub_vectors <- vector_numerico - num_vector1
sub_vectors
[1]  32  61   8 102   0  16
```

### Vectores de caracteres

Vectores compuestos por caracteres

```
char_vector <- c("q", "Z", "P", "a", "x", "mp")
```

### Vectores lógicos

Vectores compuestos por valores lógicos: Verdadero o Falso

`logic_vector<-c(FALSE,TRUE,TRUE,FALSE,TRUE,FALSE)` o `logic_vector <- c(F,T,T,F,T,F)` 

También puedes crearlos utilizando condiciones		

```
vector_numerico
[1]  38  66  12 105   2  17

# Creating a logical vector based on a condtion
cond_vector <- (vector_numerico > 20)
cond_vector
[1]  TRUE  TRUE FALSE  TRUE FALSE FALSE
```

​					
Para acceder a un vector en cualquier posición puedes utilizar el siguiente comando: 

`nombre_vector[posición]`

Ejemplos: 

```
#Obtaining the number at the third position of vector_numerico
vector_numerico[3]
[1] 12

#Obtaining the character at the fifth position of char_vector
char_vector[5]
[1] "x"

#Obtaining the logical value at the second position of cond_vector
cond_vector[2]
[1] TRUE
```



### Matrices

Las matrices, como los vectores, están formadas por elementos del mismo tipo. Pero las matrices tienen más de 1 dimensión. Tienen columnas y filas, definidas como se muestra a continuación. 

![Difference Between Row and Column | Compare the Difference Between Similar  Terms](https://www.differencebetween.com/wp-content/uploads/2018/09/Difference-Between-Row-and-Column-fig-2.png)

*Reference*. (https://www.differencebetween.com/wp-content/uploads/2018/09/Difference-Between-Row-and-Column-fig-2.png)

Para crear una matriz puede utilizar los siguientes comandos

```
#Creating a matrix of zeros having 10 rows and 5 columns
zero_matrix <- matrix(0,nrow=10,ncol=5)
zero_matrix
 [,1] [,2] [,3] [,4] [,5]
 [1,]    0    0    0    0    0
 [2,]    0    0    0    0    0
 [3,]    0    0    0    0    0
 [4,]    0    0    0    0    0
 [5,]    0    0    0    0    0
 [6,]    0    0    0    0    0
 [7,]    0    0    0    0    0
 [8,]    0    0    0    0    0
 [9,]    0    0    0    0    0
[10,]    0    0    0    0    0

#Creating a 2-dim matrix using the vector vector_numerico
fromvector_matrix <- matrix(vector_numerico, ncol=2, nrow=3)
fromvector_matrix
     [,1] [,2]
[1,]   38  105
[2,]   66    2
[3,]   12   17

#Creating a matrix by joining two vectors (per columns)
bycolums_matrix <- cbind(vector_numerico, num_vector1)
bycolums_matrix
     num_vector num_vector1
[1,]         38           6
[2,]         66           5
[3,]         12           4
[4,]        105           3
[5,]          2           2
[6,]         17           1

#Creating a matrix by joining two vectors (per rows)
byrows_matrix <- rbind(vector_numerico, num_vector1)
byrows_matrix
                  [,1] [,2] [,3] [,4] [,5] [,6]
vector_numerico    38   66   12  105    2   17
num_vector1         6    5    4    3    2    1
```

Para introducir elementos en matrices debe especificar dos posiciones, el número de columna y el número de fila:

`matrix_name[row_position,column_position] # ALWAYS in that order` 

Ejemplos:

```
fromvector_matrix[2,1]
[1] 66

bycolums_matrix[4,2]
num_vector1 
          3 
          
byrows_matrix[2,3]
num_vector1 
          4 
```

NOTA. Las operaciones aritméticas también pueden aplicarse sobre matrices. [See More](http://www.philender.com/courses/multivariate/notes/matr.html)

### Data frames

Los data frames son colecciones de elementos de cualquier tipo, es decir, números, caracteres, valores lógicos, vectores, matrices e incluso otros marcos de datos. 

Para crear un marco de datos puede utilizar el comando `data.frame()`				

```
fromvectors_dataframe <- data.frame(vector_numerico, num_vector1, cond_vector, char_vector)
fromvectors_dataframe
num_vector num_vector1 cond_vector char_vector
1         38           6        TRUE           q
2         66           5        TRUE           Z
3         12           4       FALSE           P
4        105           3        TRUE           a
5          2           2       FALSE           x
6         17           1       FALSE          mp
```



### ggplot2

Para instalar la paqueteria ggplot2 debemos de usar el siguiente comando:

```
install.packages("ggplot2")
```

Una vez intalada o instaladas distintas paqueterias estas debe de ser cargadas usaldo el comando `library`

```
library (ggplot2)
```

### Cargar los datos de ejemplo

Cargamos los datos de ejemplo, que son los precios de las casas en los diferentes estados de USA.

```
housing <- read_csv("dataSets/landdata-states.csv")
```

Para ver la estructura del archivo podemos usar el comando `head`

```
head(housing)
```

Histograma con los gráficos base o precargados:

```
hist(housing$Home.Value)
```

Histograma con ggplot2:

```
ggplot(housing, aes(x = Home.Value)) +
  geom_histogram()
```



```
ggplot(filter(housing, State %in% c("MA", "TX")),
       aes(x=Date, y=Home.Value, color=State))+
       geom_point()
```

### Mapeo aestético

En ggplot2, aestético significa “algo que puedes ver”. Algunos ejemplos son:

- Posición (por ejemplo, los ejes x e y)
- Color (color “externo”)
- Fill (color de relleno)
- Shape (forma de puntos)
- Linetype (tipo de linea)
- Size (tamaño)

Cada tipo de objeto geométrico (geom) solo acepta un subconjunto de todos los aestéticos. Puedes consultar la pagina de ayuda de `geom()` para ver que aestéticos acepta. El mapeo aestético se hace con la función `aes()`.



### Objetos geométricos

Los objetos geométricos son las formas que puede tomar un gráfico. Algunos ejemplos son:

- Puntos (`geom_point()` para scatter plots, gráficos de puntos, etc…)
- Lineas (`geom_line()` para series temporales, lineas de tendencia, etc…)
- Cajas (`geom_boxplot()` para gráficos de cajas)

Un gráfico debe tener al menos un *geom*, pero no hay limite. Puedes añadir más *geom* usando el signo +.

Con el siguiente código podrás ver una lista de los objetos geométricos:

```
help.search("geom_", package = "ggplot2")
```

### Algunos otros Gráficos:

```
hp2001Q1 <- filter(housing, Date == 2001.25)

ggplot(hp2001Q1,
       aes(y = Structure.Cost, x = Land.Value)) +
  geom_point()
```

También se pueden hacer operaciones aritmeticas dentro de la linea de comando del gráfico:

```
ggplot(hp2001Q1,
       aes(y = Structure.Cost, x = log(Land.Value))) +
  geom_point()
```

Si desean saber mas sobre este tutorial consulta el siguiente enlace: https://rpubs.com/anlope10/562981


















































































































