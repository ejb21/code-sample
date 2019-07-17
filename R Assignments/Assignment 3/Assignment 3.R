# PROBLEM 1

rm(list = ls())                       # clearing environment

vectorFrame <- function(df, v)
{
  if(length(v) == nrow(df))           # check for proper length
  {
    index <- nrow(df) + 1             # index of additional row
    df[index] <- v                    # add vector to data frame
    return(df)                        # return new data frame
  }
  else break                          # break if vector is of wrong size
}

a <- c("a", "b", "c")
b <- c("one", "two", "three")
c <- c("do", "re", "mi")
df <- data.frame(a, b, c)             # data frame of Jackson 5 lyrics

v <- c("you", "me", "girl")           # vector with three values

x <- vectorFrame(df, v)               # function call
x                                     # voila



# PROBLEM 2

rm(list = ls())                       # clear environment

vectorFrame <- function(df, v)
{
  if(length(v) > 0 && length(v) <= nrow(df))    # check that vector is neither empty nor overlarge 
  {
    index <- nrow(df) + 1             # index of new data frame column
    
    for(i in 1:length(v))             # for every value in the vector...
    {
      df[i, index] <- v[i]            # ...add that value to the new row
    }
    
    return(df)                        # return the data frame
  }
  else break                          # break if the vector is empty or overlarge
}

a <- c("a", "b", "c")
b <- c("one", "two", "three")
c <- c("do", "re", "mi")
df <- data.frame(a, b, c)             # another Jackson 5 data frame

v <- c("you")                         # testing with vector of length 1

x <- vectorFrame(df, v)               # function call
x                                     # it works

df <- data.frame(a, b, c)             # reset data frame
v <- c("you", "me")                   # vector of length 2
x <- vectorFrame(df, v)               # function call
x                                     # it works

df <- data.frame(a, b, c)
v <- c("you", "me", "girl")           # vector of length 3
x <- vectorFrame(df, v)
x                                     # still works



# PROBLEM 3

rm(list = ls())                             # clear environment

inventory <- read.csv("http://www.ejb21.me/inventory.csv")    # reading CSV from Internet so I
                                                              # don't have to worry about setwd()
idBelowValue <- function(val)
{
  items <- c()                              # empty vector to eventually return
  index <- 1                                # index of empty vector (not necessary, but oh well)
  
  for(i in 1:nrow(inventory))               # for every entry in the CSV file
  {
    if(inventory[i, 4] < val)               # if quantity is below the given value...
    {
      items[index] <- inventory[i, 1]       # ...add the entry's ID to the vector...
      index <- index + 1                    # ...increment the vector counter...
    }
  }
  
  return(items)                             # ...and finally, return the vector
}

x <- idBelowValue(10)                       # test case with value 10
x                                           # works

x <- idBelowValue(20)                       # test case with value 20
x                                           # works



# PROBLEM 4

rm(list = ls())                                 # clear environment

sortUniqNum <- function(v)
{
  nums <- c()                                   # empty vector to eventually return
  index <- 1                                    # another unnecessary index
  
  for(i in 1:length(v))                         # for every value in the vector argument...
  {
    if(!is.na(as.numeric(v[i])))                # ...if it's not a letter...
    {
      nums[index] <- as.numeric(v[i])           # ...convert to numeric and add to vector...
      index <- index + 1                        # ...and increment the vector index
    }
    
    nums <- sort(nums, decreasing = FALSE)      # sort the finished vector in increasing order
    nums <- unique(nums)                        # eliminate duplicate values
  }
  
  return(nums)                                  # return sorted, unique, numeric vector
}

alphanum <- c("a", 1, "b", 4, "c", 1, "d", 3, "e", 3, "f", 2, "g", 4)   # test vector, alphanumeric

x <- sortUniqNum(alphanum)                      # function call
x                                               # amazing



# PROBLEM 5

rm(list = ls())                                         # clear environment

splitFrame <- function(str)
{ 
  result <- as.vector(strsplit(str, "(: )|(, )"))       # split string arg with regular expression
  
  m <- matrix(result[[1]], nrow = 4, ncol = 2, byrow = TRUE)    # pour results row-wise into matrix
  df <- data.frame(m)                                           # convert matrix to data frame
  
  return(df)                                            # return data frame
}

str <- "alpha: 128, Red: 0, Green: 255, Blue: 128"      # test string from assignment

x <- splitFrame(str)                                    # function call
x                                                       # done