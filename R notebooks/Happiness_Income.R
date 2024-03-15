library(ggplot2)
library(tidyr)
library(dplyr)

# Read the data
data <- read.csv("~/Desktop/portfolio/all_london_data.csv")

# Plot the chart with the selected colours and features
ggplot(data, aes(x = factor(Income.deprivation.rate), y = Average.Happiness.Score, size = Percent.Green.and.Blue, fill = Percent.Green.and.Blue)) +
  geom_point(alpha = 0.7, shape = 21, color = "darkgrey") +
  geom_smooth(method = "lm", se = TRUE, color = "#0772a8", aes(group = 1), linetype = "solid", size = 1) +
  scale_size_continuous(range = c(2, 20), guide = "none") +  
  scale_fill_gradient(low = "#bfe8b0", high = "#348f13", guide = "none") +  
  labs(title = "Average Happiness Score vs Income Deprivation Rate",
       x = "Income Deprivation Rate",
       y = "Average Happiness Score") +
  theme_minimal() +
  scale_x_discrete(breaks = c("9.5%", "17.0%", "10.0%", "14.0%", "6.4%")) +
  theme(
    panel.grid.major = element_blank(),  
    panel.grid.minor = element_blank(),  
    plot.title = element_text(family = "Arial", face = "bold", hjust = 0.5)  
  )



