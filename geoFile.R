# use leaflet to create map, use ggmap to grab latitude and longitude of the
# cities from google
library(leaflet)
library(ggmap)

# World's largest cities:
## Taken from http://www.worldatlas.com/citypops.htm

# write down names of cities
cities <- c("TOKYO", "JAKARTA", "DELHI", "MANILA", "SEOUL", "SHANGHAI", "KARACHI",
            "BEIJING", "NEW YORK CITY", "GUANGZHAO")
colors <- c(rep("RED", 8), "BLUE", "RED")

# collect population (in millions) of each city
pop <- c(37.8, 30.5, 25.0, 24.1, 23.5, 23.4, 22.1, 21.0, 20.6, 20.6) * 1000000

# merge into data frame with longitude and latitude
df <- data.frame(city = cities, color = colors, population = pop, 
                 geocode(cities))

# create leaflet map of world's ten largest cities according to worldatlas.com
map <- df %>% leaflet() %>% addTiles %>% 
  addCircles(radius = (df$population)/25, weight = .5, color = df$color, 
             popup= paste0(df$city, " (",df$population, ")"))

map