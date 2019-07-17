#  PROBLEM 1

library("tm")
setwd("C:/Users/Eric/Documents/Penn College/CIT460/Assignment 2")
churchill <- VCorpus(DirSource("Churchill", encoding = "UTF-8"))

churchill <- tm_map(churchill, removePunctuation, lazy = TRUE)
churchill <- tm_map(churchill, tolower, lazy = TRUE)
churchill <- tm_map(churchill, removeWords, stopwords("english"))
churchill <- tm_map(churchill, removeWords, c("the", "upon", "what", "and", "may", "can", "for", "this", 
                                              "with", "without", "shall", "like", "thus", "that", "also", "will"))
churchill <- tm_map(churchill, stripWhitespace, lazy = TRUE)

churchillPTD <- tm_map(churchill, PlainTextDocument)
dtm <- DocumentTermMatrix(churchillPTD)
highFreqTerm <- findFreqTerms(dtm, 25)
freq <- sort(colSums(as.matrix(dtm)), decreasing = TRUE)

library("wordcloud")
set.seed(555)
wordcloud(names(freq), freq, min.freq = 1, max.words = 200, colors = brewer.pal(8, "Dark2"))

barplot(freq[1:20], xlab = "Terms", ylab = "Frequency", col = heat.colors(20))

findAssocs(dtm, "war", 0.65)
findAssocs(dtm, "peace", 0.80)



#  PROBLEM 2

setwd("C:/Users/Eric/Documents/Penn College/CIT460/Assignment 2/Decisions")

files <- c("1.pdf", "2.pdf", "3.pdf", "4.pdf", "5.pdf", "6.pdf", "7.pdf", "8.pdf",
           "9.pdf", "10.pdf", "11.pdf", "12.pdf", "13.pdf", "14.pdf", "15.pdf", "16.pdf")

install.packages("pdftools")
library("pdftools")
pdfs <- lapply(files, pdf_text)
decisions <- Corpus(VectorSource(pdfs))

decisions <- tm_map(decisions, removePunctuation, lazy = TRUE)
decisions <- tm_map(decisions, tolower)
decisions <- tm_map(decisions, removeNumbers)
decisions <- tm_map(decisions, removeWords, stopwords("english"))
decisions <- tm_map(decisions, stripWhitespace)

dtm <- DocumentTermMatrix(decisions)
freq <- sort(colSums(as.matrix(dtm)), decreasing = TRUE)

library("wordcloud")
set.seed(555)
wordcloud(names(freq), freq, min.freq = 1, max.words = 200, colors = brewer.pal(8, "Dark2"))

barplot(freq[1:20], xlab = "Terms", ylab = "Frequency", col = heat.colors(20))