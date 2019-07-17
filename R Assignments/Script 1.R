N <- 10
a <- rnorm(N)
b <- rnorm(N)
c <- a * b


d <- rep(NA , N)

for ( i in 1:N )
{
  d[i] <- a[i] * b[i];
}


counter <- 1

while ( counter < 5 )
{
  print ( counter )
  counter <- counter + 1
}


for ( i in c( 4, 2, 1, 9, 8) )
{
  print( i )
}


x <- rnorm( 1000 )
counter <- 0

for ( i in 1:length(x) )
{
  if ( abs( x[i] ) < 1 )
    counter <- counter + 1
}

print( counter / 1000 )




#   BASIC FUNCTIONS


?seq

seq( 1, 10 )
seq( 2 , 30 , 7 )

s <- seq( 2 , 32 , 7 )
typeof( s )
class( s )
length( s )


rep( 6 , 3 )

l <- c( 4 , 3 , 2 , 7 , 6 , 4 )
l[2]
l[2:4]
l[c( 2 , 4 )]
l[-2]
l[-c( 2 , 4 )]


a <- c( 2 , 3 , 4 )
b <- c( 5 , 6 , 7 )
a + b

a <- c( 2 , 3 , 4 , 5 , 5 , 6 )
a + b


rep( 2:4 , 3 )
rep( 2:4 , each = 3 )
rep( 2:4 , each = 3 , length.out = 8 )


rm( list = ls() )




#   FUNCTIONS


f_to_k <- function( temp )
{
  kelvin <- ( temp - 32 ) * ( 5/9 ) + 273.15
  return( kelvin )
}

f_to_k( 100 )
f_to_k( 35 )


foo <- function( par1 , par2 = 10 )
{
  result <- par1 + par2
  return( result )
}

foo( 20 )
foo( 2 , 3 )



apropos("mea")
apropos("\\[")

a <- c(1, 2, 3, NA, NA, 5, NA)
a
is.na(a)
mean(a)

mean(a, na.rm = T)
mean(a)

b <- c(1, 2, NULL, NULL, 5)
b
mean(b)
b[3] <- 4
b


library(magrittr)
c <- c(1, 2, 3, 5, 6, 9)
mean(c)
c %>% mean

d <- c(1, 2, 3, NA, NA, 5, 6, NA, 9)
mean(d, na.rm = T)
d %>% is.na() %>% sum()
d %>% mean(na.rm=T)


# data.frame is a tabular object consisting of rows and columns

rm(list = ls())

x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")

theDF <- data.frame(x, y, q)
theDF

tempDF <- data.frame(1:5, 2:6)
tempDF

colnames(theDF) <- (c("First", "Second", "Sport"))

nrow(theDF)
ncol(theDF)
dim(theDF)
names(theDF)
rownames(theDF)

head(theDF)
head(theDF, 2)

tail(theDF)
tail(theDF, 2)

theDF$Sport
theDF[,1]
theDF[1,]
theDF[1,1]
summary(theDF)

theDF[,c(1, 3)]
theDF[1:3, c(1,3)]

theDF[, "First"]
theDF[, c("First", "Sport")]

class(theDF["Sport"])
class(theDF[, "Sport"])


states <- c("PA", "NY", "NJ", "NY", "TN", "MA", "PA", "NY")
class(states)
typeof(states)
fs <- factor(states)
fs
summary(fs)



lst0 <- list(1, 2, 3)
lst0

lst1 <- list(c(1, 2, 3, 4))
lst1

lst <- list(c(1, 2, 3), 3:7)
lst



rm(list = ls())
?matrix

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol=3, byrow = TRUE, 
               dimnames = list(c("row1", "row2"), c("C.1", "C.2", "C.3")))
mdat

A <- matrix(1:10, nrow = 5)
A

B <- matrix(1:10, nrow = 2)
B

nrow(A)
ncol(A)
dim(A)

E <- matrix(1:6, nrow = 2)
E

F <- matrix(11:16, nrow = 2)
F

E + F
E - F
E * F
E / F
E == F

t(F)  # transpose


?array
mdArray <- array(1:12, dim = c(2, 3, 2))
mdArray

mdArray[, 2,]
mdArray[1, , 1]



























































