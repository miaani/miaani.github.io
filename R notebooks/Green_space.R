# Import and load the libraries that we need for the chart
library(sf)
library(ggplot2)

# Load in the datasets both the shapefile and the csv
londonmap <- st_read("~/Desktop/portfolio/london-boroughs_1179.geojson")
data <- read.csv("~/Desktop/portfolio/all_london_data.csv")

# Merge the datasets together to create one dataset
merged_data <- merge(londonmap, data, by.x = "name", by.y = "Borough")

# Create the chart!
ggplot() +
  geom_sf(data = merged_data, aes(fill = Percent.Green), color = "white") +
  scale_fill_gradient(name = "Percentage", low = "#bfe8b0", high = "#348f13") +
  theme_void() +
  theme(panel.border = element_blank(),
        plot.margin = unit(c(1,1,1,1), "cm"),
        plot.title = element_text(size = 15, face = "bold", hjust = 0.5, color = "#444444", family = "Arial")) +
  labs(title = "Green Cover")
