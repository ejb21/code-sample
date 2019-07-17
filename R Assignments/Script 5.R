# make three vectors and combine them as columns in a data.frame

sport <- c("Hockey", "Baseball", "Football")
league <- c("NHL", "MLB", "NFL")
trophy <- c("Stanley Cup", "Commissioner's Trophy", "Vince Lombardi Trophy")

sport


trophies1 <- cbind(sport, league, trophy)

trophies1

# make another data.frame using data.frame()
trophies2 <- data.frame(sport=c("Basketball", "Golf"),
                        league=c("NBA", "PGA"),
                        trophy=c("Larry O'Brien Championship Trophy", "Wanamaker Trophy"),
                        stringsAsFactors=FALSE)


trophies2



# combine them into one data.frame with rbind
trophies <- rbind(trophies1, trophies2)


trophies



cbind(Sport=sport, Association=league, Prize=trophy)



#*****************   jooins


download.file(url="http://jaredlander.com/data/US_Foreign_Aid.zip",
              destfile="data/ForeignAid.zip")
unzip("data/ForeignAid.zip", exdir="data")


getwd()

library(stringr)
# first get a list of the files
theFiles <- dir("data/", pattern="\\.csv")


theFiles


## loop through those files
for(a in theFiles)
{
  # build a good name to assign to the data
  nameToUse <- str_sub(string=a, start=12, end=18)
  # read in the csv using read.table
  # file.path is a convenient way to specify a folder and file name
  temp <- read.table(file=file.path("data", a),
                     header=TRUE, sep=",", stringsAsFactors=FALSE)
  # assign them into the workspace
  assign(x=nameToUse, value=temp)
}


nameToUse
theFiles

Aid_10s



Aid90s00s <- merge(x=Aid_90s, y=Aid_00s,
                   by.x=c("Country.Name", "Program.Name"),
                   by.y=c("Country.Name", "Program.Name"))
head(Aid90s00s)



#*****************  plyr join

install.packages("plyr")
library(plyr)
Aid90s00sJoin <- join(x=Aid_90s, y=Aid_00s,
                      by=c("Country.Name", "Program.Name"))
head(Aid90s00sJoin)


# first figure out the names of the data.frames
frameNames <- str_sub(string=theFiles, start=12, end=18)
# build an empty list
frameList <- vector("list", length(frameNames))
names(frameList) <- frameNames
# add each data.frame into the list
for(a in frameNames)
{
  frameList[[a]] <- eval(parse(text=a))
}


head(frameList[[1]])

head(frameList[["Aid_00s"]])
head(frameList[[5]])
head(frameList[["Aid_60s"]])



allAid <- Reduce(function(...){
  join(..., by=c("Country.Name", "Program.Name"))
},
frameList)
dim(allAid)

install.packages("useful")
library(useful)
corner(allAid, c=15)


bottomleft(allAid, c=15)



#**************   data table merge

install.packages("data.table")
library(data.table)
dt90 <- data.table(Aid_90s, key=c("Country.Name", "Program.Name"))
dt00 <- data.table(Aid_00s, key=c("Country.Name", "Program.Name"))

dt0090 <- dt90[dt00]
dt0090






#*****************  reshape2

head(Aid_00s)
library(reshape2)
melt00 <- melt(Aid_00s, id.vars=c("Country.Name", "Program.Name"),
               variable.name="Year", value.name="Dollars")
tail(melt00, 10)



library(scales)
# strip the "FY" out of the year column and convert it to numeric
melt00$Year <- as.numeric(str_sub(melt00$Year, start=3, 6))
# aggregate the data so we have yearly numbers by program
meltAgg <- aggregate(Dollars ~ Program.Name + Year, data=melt00,
                     sum, na.rm=TRUE)
# just keep the first 10 characters of program name
# then it will fit in the plot
meltAgg$Program.Name <- str_sub(meltAgg$Program.Name, start=1, end=10)
ggplot(meltAgg, aes(x=Year, y=Dollars)) +
  geom_line(aes(group=Program.Name)) +
  facet_wrap(~ Program.Name) +
  scale_x_continuous(breaks=seq(from=2000, to=2009, by=2)) +
  theme(axis.text.x=element_text(angle=90, vjust=1, hjust=0)) +
  scale_y_continuous(labels=multiple_format(extra=dollar,
                                            multiple="B"))




cast00 <- dcast(melt00, Country.Name + Program.Name ~ Year,
                value.var="Dollars")
head(cast00)


