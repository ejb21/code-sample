#source
#http://pakillo.github.io/R-GIS-tutorial/

#http://www.milanor.net/blog/maps-in-r-plotting-data-points-on-a-map/

#data source
#https://openflights.org/data.html



getwd()
airports <- read.csv("data/airports.dat", header = FALSE)

airports
colnames(airports) <- c("ID", "name", "city", "country", "IATA_FAA", "ICAO", "lat", "lon", "altitude", "timezone", "DST")
head(airports)


install.packages("rworldmap")

library(rworldmap)
newmap <- getMap(resolution = "low")
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1)


points(airports$lon, airports$lat, col = "red", cex = 0.6)




routes <- read.csv("data/routes.dat", header=F)
colnames(routes) <- c("airline", "airlineID", "sourceAirport", "sourceAirportID", "destinationAirport", "destinationAirportID", "codeshare", "stops", "equipment")
head(routes)




library(plyr)

departures <- ddply(routes, .(sourceAirportID), "nrow")
departures

names(departures)[2] <- "flights"
arrivals <- ddply(routes, .(destinationAirportID), "nrow")
names(arrivals)[2] <- "flights"

airportD <- merge(airports, departures, by.x = "ID", by.y = "sourceAirportID")
airportA <- merge(airports, arrivals, by.x = "ID", by.y = "destinationAirportID")

install.packages("ggmap")
library(ggmap)
map <- get_map(location = 'Europe', zoom = 4)

mapPoints <- ggmap(map) +
     geom_point(aes(x = lon, y = lat, size = sqrt(flights)), data = airportD, alpha = .5)
mapPoints

install.packages("ggplot2")
library(ggplot2)

#*************  issues with limit

mapPointsLegend <- mapPoints +
  scale_area(breaks = sqrt(c(1, 5, 10, 50, 100, 500)), labels = c(1, 5, 10, 50, 100, 500), name = "departing routes")
mapPointsLegend

#***************************




airports <- read.csv("data/airports.dat", header = FALSE)
colnames(airports) <- c("ID", "name", "city", "country", "IATA_FAA", "ICAO", "lat", "lon", "altitude", "timezone", "DST")
head(airports)

library(rworldmap)
newmap <- getMap(resolution = "low")
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1)

points(airports$lon, airports$lat, col = "red", cex = .6)

routes <- read.csv("data/routes.dat", header=F)
colnames(routes) <- c("airline", "airlineID", "sourceAirport", "sourceAirportID", "destinationAirport", "destinationAirportID", "codeshare", "stops", "equipment")
head(routes)

library(plyr)
departures <- ddply(routes, .(sourceAirportID), "nrow")
names(departures)[2] <- "flights"
arrivals <- ddply(routes, .(destinationAirportID), "nrow")
names(arrivals)[2] <- "flights"

airportD <- merge(airports, departures, by.x = "ID", by.y = "sourceAirportID")
airportA <- merge(airports, arrivals, by.x = "ID", by.y = "destinationAirportID")

library(ggmap)
map <- get_map(location = 'Europe', zoom = 4)

mapPoints <- ggmap(map) +
  geom_point(aes(x = lon, y = lat, size = sqrt(flights)), data = airportD, alpha = .5)

mapPointsLegend <- mapPoints +
  scale_area(breaks = sqrt(c(1, 5, 10, 50, 100, 500)), labels = c(1, 5, 10, 50, 100, 500), name = "departing routes")
mapPointsLegend


# create the data set containing both departures and arrivals
airportD$type <- "departures"
airportA$type <- "arrivals"
airportDA <- rbind(airportD, airportA)

# map the data
# map + data points
mapPointsDA <- ggmap(map) +
  geom_point(aes(x = lon, y = lat, size = sqrt(flights)), data = airportDA, alpha = .5)
# adjust the legend
mapPointsLegendDA <- mapPointsDA 
+
  scale_area(breaks = sqrt(c(1, 5, 10, 50, 100, 500)), labels = c(1, 5, 10, 50, 100, 500), name = "routes")
# panels according to type (departure/arrival)
mapPointsFacetsDA <- mapPointsLegendDA +
  facet_grid(. ~ type)

# plot the map
mapPointsFacetsDA


##############   Part 2
##############   More examples


#source
#https://blog.dominodatalab.com/geographic-visualization-with-rs-ggmaps/


install.packages("ggmap")

library(ggmap)

?ggmap::qmap

location <- "Williamsport, PA"
qmap(location)
qmap(location, zoom = 14, maptype = "hybrid")

qmap(location = "boston university")

qmap(location = "boston university", zoom = 14)

qmap(location = "boston university", zoom = 14,source = "osm")


mydata = read.csv("data/vehicle-accidents.csv")

mydata$State <- as.character(mydata$State)

mydata$MV.Number = as.numeric(mydata$MV.Number)

mydata = mydata[mydata$State != "Alaska", ]

mydata = mydata[mydata$State != "Hawaii", ]




for (i in 1:nrow(mydata)) {
  
  latlon = geocode(mydata[i,1])
  
  mydata$lon[i] = as.numeric(latlon[1])
  
  mydata$lat[i] = as.numeric(latlon[2])
  
}



mv_num_collisions = data.frame(mydata$MV.Number, mydata$lon, mydata$lat)

colnames(mv_num_collisions) = c('collisions','lon','lat')

usa_center = as.numeric(geocode("United States"))

usa_center

USAMap = ggmap(get_googlemap(center=usa_center, scale=2, zoom=4), extent="normal")

USAMap


USAMap + 
  geom_point(aes(x=lon, y=lat), data=mv_num_collisions, col="orange", alpha=0.4, size=mv_num_collisions$collisions*.01) +
  scale_size_continuous(range=range(mv_num_collisions$collisions))





########   Another example

library(ggplot2)
library(ggmap)

# creating a sample data.frame with your lat/lon points
lon <- c(-38.31,-35.5)
lat <- c(40.96, 37.5)
df <- as.data.frame(cbind(lon,lat))

# getting the map
mapgilbert <- get_map(location = c(lon = mean(df$lon), lat = mean(df$lat)), zoom = 4,
                      maptype = "satellite", scale = 2)

# plotting the map with some points on it
ggmap(mapgilbert) +
  geom_point(data = df, aes(x = lon, y = lat, fill = "red", alpha = 0.8), size = 5, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)



##############
#source
#https://www.r-bloggers.com/r-beginners-plotting-locations-on-to-a-world-map/
library("ggmap")
library(maptools)
library(maps)


visited <- c("SFO", "Chennai", "London", "Melbourne", "Johannesbury, SA")
ll.visited <- geocode(visited)
visit.x <- ll.visited$lon
visit.y <- ll.visited$lat
#> dput(visit.x)
#c(-122.389979, 80.249583, -0.1198244, 144.96328, 28.06084)
#> dput(visit.y)
#c(37.615223, 13.060422, 51.5112139, -37.814107, -26.1319199)

#USING MAPS
map("world", fill=TRUE, col="white", bg="lightblue", ylim=c(-60, 90), mar=c(0,0,0,0))
points(visit.x,visit.y, col="red", pch=16)



#Using GGPLOT, plot the Base World Map
mp <- NULL
mapWorld <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
mp <- ggplot() +   mapWorld

#Now Layer the cities on top
mp <- mp+ geom_point(aes(x=visit.x, y=visit.y) ,color="blue", size=3) 
mp



######################
# source
#https://sarahleejane.github.io/learning/r/2014/09/21/plotting-data-points-on-maps-with-r.html


#Get the world map country border points
library(maps)
library(ggplot2)
world_map <- map_data("world")


#Look at data for Switzerland and Malta
Switzerland <- subset(world_map, world_map$region=="Switzerland")
Malta <- subset(world_map, world_map$region=="Malta")

Switzerland
Malta

#Creat a base plot with gpplot2
p <- ggplot() + coord_fixed() +
  xlab("") + ylab("")

#Add map to base plot
base_world_messy <- p + geom_polygon(data=world_map, aes(x=long, y=lat, group=group), 
                                     colour="light green", fill="light green")

base_world_messy



#Strip the map down so it looks super clean (and beautiful!)
cleanup <- 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
        panel.background = element_rect(fill = 'white', colour = 'white'), 
        axis.line = element_line(colour = "white"), legend.position="none",
        axis.ticks=element_blank(), axis.text.x=element_blank(),
        axis.text.y=element_blank())

base_world <- base_world_messy + cleanup

base_world

map.cities(x = world.cities, country = "", label = NULL, minpop = 0,
           maxpop = Inf, capitals = 0, cex = par("cex"), projection = FALSE,
           parameters = NULL, orientation = NULL, pch = 1)













#***************  another sample
require(ggplot2)
require(ggmap)
require(maps)
LA <- map_data("state", region="louisiana")

salesCalls <- data.frame(State=rep("louisiana",5), 
                         City=c("Baton Rouge", "New Orleans", "Shreveport", 
                                "Lafayette", "Mandeville"),
                         Calls=c(10,5,8,13,2))

salesCalls <- cbind(geocode(as.character(salesCalls$City)), salesCalls)

salesCalls


ggplot(LA, aes(x=long, y=lat)) +
  geom_polygon() +
  coord_map() +
  geom_point(data=salesCalls, aes(x=lon, y=lat, size=Calls), color="orange")



ggmap(get_map(location = 'Louisiana', zoom = 7)) +
  geom_point(data=salesCalls, aes(x=lon, y=lat, size=Calls), color="orange")




#                     Making maps in R
#source
#http://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html



# these are packages you will need, but probably already have.
# Don't bother installing if you already have them
install.packages("ggplot2")
install.packages("devtools")
install.packages("dplyr")
install.packages("stringr")

# some standard map packages.
install.packages("maps")
install.packages("mapdata")

# the github version of ggmap, which recently pulled in a small fix I had
# for a bug 
devtools::install_github("dkahle/ggmap")



library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)



usa <- map_data("usa")

dim(usa)
#> [1] 7243    6

head(usa)


tail(usa)


w2hr <- map_data("world2Hires")

dim(w2hr)
#> [1] 2274539       6

head(w2hr)


tail(w2hr)



usa <- map_data("usa") # we already did this, but we can do it again
ggplot() + geom_polygon(data = usa, aes(x=long, y = lat, group = group)) + 
  coord_fixed(1.3)


ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = NA, color = "red") + 
  coord_fixed(1.3)



gg1 <- ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = "violet", color = "blue") + 
  coord_fixed(1.3)
gg1



labs <- data.frame(
  long = c(-122.064873, -122.306417),
  lat = c(36.951968, 47.644855),
  names = c("SWFSC-FED", "NWFSC"),
  stringsAsFactors = FALSE
)  

gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 5) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 4)




ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat), fill = "violet", color = "blue") + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 5) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 4) +
  coord_fixed(1.3)



states <- map_data("state")
dim(states)
#> [1] 15537     6

head(states)


tail(states)



ggplot(data = states) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + 
  coord_fixed(1.3) +
  guides(fill=FALSE)  # do this to leave off the color legend


west_coast <- subset(states, region %in% c("california", "oregon", "washington"))

ggplot(data = west_coast) + 
  geom_polygon(aes(x = long, y = lat), fill = "palegreen", color = "black") 




ggplot(data = west_coast) + 
  geom_polygon(aes(x = long, y = lat, group = group), fill = "palegreen", color = "black") + 
  coord_fixed(1.3)


ca_df <- subset(states, region == "california")

head(ca_df)


counties <- map_data("county")
ca_county <- subset(counties, region == "california")


ca_base <- ggplot(data = ca_df, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) + 
  geom_polygon(color = "black", fill = "gray")
ca_base + theme_nothing()


ca_base + theme_nothing() + 
  geom_polygon(data = ca_county, fill = NA, color = "white") +
  geom_polygon(color = "black", fill = NA)  # get the state border back on top




library(stringr)
library(dplyr)
library(magrittr)

# make a data frame
x <- readLines("data/ca-counties-wikipedia4.txt")
x <- str_replace_all(x, ",", "")

x <- x %>% tolower()

x

pop_and_area <- str_match(x, "^([a-zA-Z ]+)County\t.*\t([0-9,]{2,10})\t([0-9,]{2,10}) sq mi$")[, -1] %>%
  na.omit() %>%
  #  str_replace_all(",", "") %>%
  #  str_trim() %>%
  #  tolower() %>%
  as.data.frame(stringsAsFactors = FALSE)


pop_and_area

# give names and make population and area numeric
names(pop_and_area) <- c("subregion", "population", "area")
pop_and_area$population <- as.numeric(pop_and_area$population)
pop_and_area$area <- as.numeric(pop_and_area$area)

head(pop_and_area)




ca_county

#****************   needs work!

cacopa <- inner_join(ca_county, pop_and_area, by = "subregion")
cacopa

