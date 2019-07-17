setwd("C:/Users/Eric/Documents/Penn College/CIT460")

people <- read.csv(file = "people.csv", header = TRUE)
people
class(people)
names(people)

people <- read.csv(file = "people.csv", header = FALSE)
people
names(people)

people <- read.csv(file.choose(), header = FALSE)
people






theURL <- "http://www.jaredlander.com/data/TomatoFirst.csv"

tomato <- read.table(file = theURL, header = TRUE, sep = ",")
tomato
?read.table


theURL <- "http://www.jaredlander.com/data/TomatoFirst.csv"
library(readr)
tomato2 <- read_delim(file = theURL, delim = ',')
head(tomato2, 6)
colnames(tomato2)



install.packages(data.table)
library(data.table)

tomato3 <- fread(input = theURL, sep = ",", header = TRUE)
head(tomato3, 2)




library(readxl)

employee <- read_excel('employee.xlsx')
employee
class(employee)

employee <- read_excel('employee.xlsx', col_types = c("text", "text", "numeric", "numeric"))
employee

employee$Year

summary(employee)

yearAsFactor <- factor(employee$Year)
employee$Year <- yearAsFactor

summary(employee)



download.file(url='http://www.jaredlander.com/data/ExcelExample.xlsx', destfile = 'ExcelExample3.xlsx')

save(tomato, file = "data/tomato.rdata")



x <- 1:10
y <- -4:5
z <- seq(from = 2, by = 7, length.out = 10)

x
y
z

df <- data.frame(x, y, z)

save(x, y, z, df, file = "data/test")

rm(x, y, z, df)

x
load(file = "data/test")
x

library(jsonlite)

pizza <- fromJSON('http://www.jaredlander.com/data/PizzaFavorites.json')
pizza
class(pizza)
class(pizza$Name)
pizza$Name
pizza$Details
class(pizza$Details)




library(RSQLite)

drv <- dbDriver('SQLite')
class(drv)

download.file("http://www.jaredlander.com/data/diamonds.db", destfile = "data/diamonds.db", mode = "wb")

con <- dbConnect(drv, "data/diamonds.db")
class(con)
dbListTables(con)
dbListFields(con, name = 'diamonds')
dbListFields(con, name = 'DiamondColors')


diamondsTable <- dbGetQuery(con, "select * from diamonds", stringsAsFactors = FALSE)
class(diamondsTable)
diamondsTable



library(rvest)
ribalta <- read_html('http://www.jaredlander.com/data/ribalta.html')
ribalta

ribalta %>%
  html_nodes('table.food-items') %>%
  magrittr::extract2(5) %>%
  html_table()

?extract2


library(XML)

url <- "https://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"

bowlPool <- readHTMLTable(url, which=1, header=FALSE, stringsAsFactors=FALSE)
bowlPool

?readHTMLTable


library(ggplot2)
data(diamonds)
head(diamonds)
hist(diamonds$carat, main = "Title", xlab = "Carat")

g <- ggplot(data = diamonds)
class(g)

geom_histogram(aes(x = carat))
class(g)
g
g + geom_histogram(aes(x = carat))

g <- ggplot(diamonds, aes(x = carat, y = price))
g + geom_point()
g + geom_point(aes(color = color))

diamonds$color

g + geom_point(aes(color = clarity))

g + geom_point(aes(color = color)) + facet_wrap(~color)



setwd("C:\\Users\\Eric\\Documents\\Penn College\\CIT460")
movies <- read.csv("Movie-Ratings.csv")
movies
colnames(movies)

factor(movies$Year)

movies$Year <- factor(movies$Year)
colnames(movies)[3] <- "CriticRating"
colnames(movies)[4] <- "AudienceRating"
colnames(movies)[5] <- "BudgetMillions"
colnames(movies)[6] <- "Year"

#alternatively...   names(movies) c("Film", "CriticRating", ...)

head(movies, 5)
names(movies)
str(movies)
summary(movies)
movies$Year <- factor(movies$Year)
summary(movies)

# Grammar of Graphics

#   Data
#   Aesthetics (color, scale, x-axis, y-axis, etc.)
#   Geometry (likeline)
#   Statistics
#   Facets (additional layers, different categories)
#   Coordinates / Zooming
#   Theme (Correlation, Placement)

library(ggplot2)
g <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))
g + geom_point()

ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre, size = Genre)) +
  geom_point()

ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre, size = BudgetMillions)) +
  geom_point()


# Layers

p <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre, size = BudgetMillions))

p + geom_point()
p + geom_line()
p + geom_line() + geom_point()    # order does matter
p + geom_point() + geom_line()


# Overriding existing aesthetics

q <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre, size = BudgetMillions))
q + geom_point(aes(size = CriticRating))
q + geom_point(aes(color = BudgetMillions))
q + geom_point(aes(x = BudgetMillions)) + xlab("Budget in Millions")

q + geom_line(size = 1) + geom_point()


r <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))

# Mapping
r + geom_point(aes(color = Genre))

# Setting
r + geom_point(color = "DarkGreen")

r + geom_point(aes(size = 10))
r + geom_point(size = 10)


# Other Geometry layers

s <- ggplot(data = movies, aes(x = BudgetMillions))
s + geom_histogram(binwidth = 10)

# Add color

s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

s + geom_density()


library(ggplot2)
t <- ggplot(data = movies, aes(x = AudienceRating))

t + geom_histogram(binwidth = 10, fill = "white", color = "blue")

t <- ggplot(data = movies)

t + geom_histogram(binwidth = 10, aes(x = AudienceRating), fill = "white", color = "blue")
t + geom_histogram(binwidth = 10, aes(x = CriticRating), fill = "white", color = "blue")


t <- ggplot()
t + geom_histogram(data = movies, binwidth = 10, aes(x = CriticRating), fill = "white", color = "blue")


u <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre))
u + geom_point()
u + geom_smooth() + geom_point()
u + geom_point() + geom_smooth(fill = NA)


u <- ggplot(data = movies, aes(x = Genre, y = AudienceRating, color = Genre))
u + geom_boxplot()
u + geom_boxplot(size = 2)

u + geom_boxplot(size = 1.2) + geom_point()
u + geom_boxplot(size = 1.2) + geom_jitter()
u + geom_jitter() + geom_boxplot(size = 1.2, alpha = .5)


v <- ggplot(data = movies, aes(x = BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre))
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black")
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") + facet_grid(Genre~.)
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") + facet_grid(Genre~., scales = "free")


w <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre))
w + geom_point()
w + geom_point(size = 3)
w + geom_point(size = 3) + facet_grid(Genre~.)
w + geom_point(size = 3) + facet_grid(.~Year)
w + geom_point(size = 3) + facet_grid(Genre~Year)


m <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, size = BudgetMillions, color = Genre))
m + geom_point()
m + geom_point() + xlim(50, 100)
m + geom_point() + xlim(50, 100) + ylim(50, 100)

w + geom_point(aes(size = BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year) + coord_cartesian(ylim = c(50, 100))



o <- ggplot(data = movies, aes(x = BudgetMillions))
o + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black")
h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black")
h + xlab("$ in Millions") + ylab("Number of Movies")
































































































































































