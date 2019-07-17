a <- c(1, 1, 1, 0, 1)
ifelse(a == 1, a * 3, a + 1)

replicate(3, 10)
rep(3, 10)

m <- matrix(c(1:20), nrow = 10, ncol = 2)
m

apply(m, 1, mean)
apply(m, 1, sum)
apply(m, 1, function(x) x[1] * x[2])
apply(m, 2, mean)
apply(m, c(1,2), function(x) x*x)

e <- new.env()
e$a <- 1:10
e$b <- rnorm(10)
eapply(e, mean)

c <- list(c(2, 3, 4), c(8, 9, 9, 9))
class(c)
c

l <- lapply(c, mean)
class(l)
l

l <- list(a = 1:10, b = 11:20)
sapply(l, mean)
class(sapply(l, mean))
typeof(sapply(l, mean))

l <- list(a = 1:10, b = 11:20)
l.fivenum <- vapply(l, fivenum, c("1st Qu." = 0, Min. = 0, Median = 0, "3rd Qu." = 0, Max. = 0))
l.fivenum

replicate(3, "Banana")
rnorm(5)
replicate(3, rnorm(5))

class(replicate(3, "Banana"))

l <- list(a = 1:10, b = 11:20)
rapply(l, function(x) x*x)
rapply(l, function(x) x*x, how = "list")



attach(iris)
head(iris, 4)
by(iris[, 1:4], Species, colMeans)
iris

e <- new.env()
e$a <- 1:10
e$b <- rnorm(10)
eapply(e, mean)

c <- list(c(2, 3, 4), c(8, 9, 9, 9))
l <- lapply(c, mean)
l
class(l)

l <- list(a = 1:10, b=11:20)
sapply(l, mean)
class(sapply(l, mean))
typeof(sapply(l, mean))

res1 <- tapply(iris$Petal.Length, Species, mean)
res2 <- by(iris$Petal.Length, Species, mean)

class(res1)
class(res2)
typeof(res1)
typeof(res2)


theMatrix <- matrix(1:9, nrow = 3)
theMatrix
apply(theMatrix, 1, sum)
apply(theMatrix, 2, sum)

rowSums(theMatrix)
colSums(theMatrix)

theMatrix[2,1] <- NA
theMatrix
apply(theMatrix, 1, sum)
apply(theMatrix, 1, sum, na.rm = T)
rowSums(theMatrix, na.rm = T)

theList <- list(A = matrix(1:9, 3), B = 1:5, c = matrix(1:4, 2), D = 2)
theList

lapply(theList, sum)
sapply(theList, sum)

theNames <- c("Jared", "Deb", "Paul")
theNames

lapply(theNames, nchar)

res <- sapply(theNames, nchar)
res[1]


firstList <- list(A = matrix(1:16, 4), B = matrix(1:16, 2), c = 1:5)
secondList <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), c = 15:1)
thirdList <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), C = 1:5)
mapply(identical, firstList, secondList)

mapply(identical, firstList, secondList, thirdList)

a <- c(2, 3, 2, 5)
b <- c(2, 7)

mapply(identical, a, b)


simpleFunc <- function(x, y)
{
  NROW(x) + NROW(y)
}

mapply(simpleFunc, firstList, secondList)

install.packages("ggplot2")
library("ggplot2")
data(diamonds, package = "ggplot2")
head(diamonds, 3)
data(diamonds)

aggregate(price~cut, diamonds, mean)
aggregate(price~cut + color, diamonds, mean)
aggregate(price~color + cut, diamonds, mean)

aggregate(price~cut, diamonds, mean)
aggregate(carat~cut, diamonds, mean)
aggregate(cbind(price, carat) ~ cut, diamonds, mean)
aggregate(cbind(price + carat) ~ cut, diamonds, mean)   # added them... bad

aggregate(cbind(price, carat) ~ color + cut, diamonds, mean)
aggregate(cbind(price, carat) ~ cut + color, diamonds, mean)

library(plyr)
head(baseball, 5)
baseball

baseball$sf[baseball$year < 1954] <- 0    # SF was not kept
any(is.na(baseball$sf))

baseball50 <- baseball[baseball$ab >= 50, ]

baseball$OBP <- with(baseball, (h + bb + hbp) / (ab + bb + hbp + sf))
tail(baseball)

obp <- function(data)
{
  c(OBP = with(data, sum(h + bb + hbp) / sum(ab + bb + hbp + sf)))
}


library("tm")
library("RCurl")
library("SnowballC")

?Corpus

setwd("C:/Users/Eric/Documents/Penn College/CIT460")
dir.create("text mining")
setwd("text mining")
dir.create("data")
setwd("data")

url <- "https://raw.githubusercontent.com/angerhang/statsTutorial/master/src/textMining/data/1.txt"
write(getURL(url), file = "1.txt")

url <- "https://raw.githubusercontent.com/angerhang/statsTutorial/master/src/textMining/data/2.txt"
write(getURL(url), file = "2.txt")

url <- "https://raw.githubusercontent.com/angerhang/statsTutorial/master/src/textMining/data/3.txt"
write(getURL(url), file = "3.txt")

setwd("..")
getwd()











shakespeare <- VCorpus(DirSource("data", encoding = "UTF-8"))
writeCorpus(shakespeare)

meta(shakespeare)
shakespeare[1]
shakespeare[[1]]
summary(shakespeare)

shakespeare <- tm_map(shakespeare, stripwhitespace, lazy = TRUE)
writeCorpus(shakespeare)

shakespeare <- tm_map(shakespeare, stemDocument, lazy = TRUE)
shakespeare <- tm_map(shakespeare, removePunctuation, lazy = TRUE)

stopwords()
stopwords("french")

shakespeare <- tm_map(shakespeare, removeWords, stopwords("english"), lazy = TRUE)
other.words <- c("the", "up", "it", "and")
shakespeare <- tm_map(shakespeare, removeWords, other.words, lazy = TRUE)

dtm <- DocumentTermMatrix(shakespeare)

highFreqTerm <- findFreqTerms(dtm, 25)
findAssocs(dtm, "love", 0.95)

freq <- sort(colSums(as.matrix(dtm)), decreasing = TRUE)

install.packages("wordcloud")
library("wordcloud")

set.seed(555)
wordcloud(names(freq), freq, min.freq = 2500, max.words = 100, colors = brewer.pal(8, "Dark2"))

barplot(freq[1:50], xlab = "Terms", ylab = "Frequency", col = heat.colors(50))





shakespeare <- tm_map(shakespeare, stopwords, lazy = TRUE)
shakespeare <- tm_map(shakespeare, stopwords("the"), lazy = TRUE)

other.words <- c("the", "up", "it")
shakespeare <- tm_map(shakespeare, stopwords(other.words), lazy = TRUE)

shakespeare <- tm_map(shakespeare, content_transformer(tolower), lazy = TRUE)

dtm <- DocumentTermMatrix(shakespeare)


shakespeare <- tm_map(shakespeare, content_transformer(removeWords), stopwords)






































































































































