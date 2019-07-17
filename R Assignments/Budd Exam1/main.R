url <- "http://www.navigationdatacenter.us/db/wcsc/data/total_waterborne_commerce.csv"


# STEP 1

shipping.info <- read.csv(url, header = TRUE)


# STEP 2

library(ggplot2)
g <- ggplot(data = shipping.info, aes(x = Year))
g + geom_line(aes(y = Total, color = "Total")) + geom_line(aes(y = Foreign, color = "Foreign")) + geom_line(aes(y = Domestic, color = "Domestic"))


# STEP 3

g <- ggplot(data = shipping.info[seq(27,40), seq(1,4)], aes(x = Year))
g + geom_line(aes(y = Total, color = "Total")) + geom_line(aes(y = Foreign, color = "Foreign")) +
  geom_line(aes(y = Domestic, color = "Domestic"))


# STEP 4

shipping.info$"Foreign Percent" <- with(shipping.info, shipping.info[, 3] / shipping.info[, 2])
shipping.info$"Domestic Percent" <- with(shipping.info, shipping.info[, 4] / shipping.info[, 2])


# STEP 5

delta.percent <- function(year)
{
  index <- year - 1973
  return(shipping.info[index, 5] - shipping.info[index, 6])
}


# STEP 6

gov.party <- data.frame(matrix(ncol = 3, nrow = 6))

colnames(gov.party) <- c("begin", "end", "party")
gov.party["begin"] <- c(1974, 1977, 1981, 1993, 2001, 2009)
gov.party["end"] <- c(1976, 1980, 1992, 2000, 2008, 2016)
gov.party["party"] <- c("Republican", "Democrat", "Republican", "Democrat", "Republican", "Democrat")


# STEP 7

shipping.info[c(1:3, 8:19, 28:35), "Party"] <- "Republican"
shipping.info[c(4:7, 20:27, 36:40), "Party"] <- "Democrat"
shipping.info


# STEP 8

g <- ggplot(data = shipping.info, aes(x = Year))
g + geom_line(aes(y = Total, color = "Total")) + geom_line(aes(y = Foreign, color = "Foreign")) +
  geom_line(aes(y = Domestic, color = "Domestic")) + facet_grid(Party~.)









####      This was my failed attempt at doing Step 7 programmatically.
####          I ended up hard-coding it.



# index <- 0
# 
# find.party <- function(year)
# {
#   shipIndex <- year - 1973
#   
#   for (index in 1:6)
#   {
#     if (year >= gov.party$begin[index] && year <= gov.party$end[index])
#     {
#       shipping.info[shipIndex, "Party"] <- gov.party[index, "party"]
#       break
#     }
#   }
# }
# 
# for(year in shipping.info$Year)
# {
#   find.party(year)
# }
# 
# shipping.info