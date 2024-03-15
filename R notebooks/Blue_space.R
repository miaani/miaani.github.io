# Load libraries that we need to run our code
library(sf)
library(ggplot2)

# load in both the geogrpahical geojson file and the csv 
londonmap <- st_read("~/Desktop/portfolio/london-boroughs_1179.geojson")
data <- read.csv("~/Desktop/portfolio/all_london_data.csv")

# Merge the geographical data with the attribute data
merged_data <- merge(londonmap, data, by.x = "name", by.y = "Borough")

# Create the graph!
ggplot() +
  geom_sf(data = merged_data, aes(fill = Percent.Blue), color = "white") +
  scale_fill_gradient(name = "Percentage", low = "#c2eaf0", high = "#0772a8") +
  theme_void() +
  theme(panel.border = element_blank(),
        plot.margin = unit(c(1,1,1,1), "cm"),
        plot.title = element_text(size = 15, face = "bold", hjust = 0.5, color = "#444444", family = "Arial")) +
  labs(title = "Blue Cover")