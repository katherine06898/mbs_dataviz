# Sample data frame
library(ggplot2)
library(dplyr)
# Remove percentage signs
dataset$Percentage_Rated_Attractive <- gsub("%", "", dataset$Percentage_Rated_Attractive)

# Convert to double
dataset$Percentage_Rated_Attractive <- as.numeric(dataset$Percentage_Rated_Attractive)

# add a column for unattractiveness
dataset$Percentage_Rated_Unattractive <- 100 - dataset$Percentage_Rated_Attractive

# Create horizontal bar chart
ggplot(dataset, aes(x = Percentage_Rated_Unattractive, y = reorder(Activity, Percentage_Rated_Unattractive))) +
  geom_bar(stat = "identity", aes(fill = Percentage_Rated_Unattractive)) +
  scale_fill_gradient(low = "skyblue", high = "darkred", name = " ") +
  scale_x_continuous(limits = c(0, 100), breaks = seq(0, 100, 20)) + # X-axis scale
  theme_minimal() + # Minimal theme for clean look
  theme(
    panel.grid.major.y = element_blank(),   # Remove horizontal grid lines
    axis.title.y = element_text(vjust = 1.5, size = 10, face = "bold"),     
    axis.title.x = element_text(vjust = -1.5, size = 10, face = "bold"),
    axis.text = element_text(size = 10),    # Adjust axis text size
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"), # Title
    plot.subtitle = element_text(hjust = 0.5, size = 10, face = "italic")              # Subtitle
  ) +
  geom_text(aes(label = paste0(Percentage_Rated_Unattractive, "%")), hjust = 1.5, size = 3, color = "white") + # Add percentage on bars
  labs(
    title = "Top 15 Unattractive Hobbies to Women Participated in Survey",
    subtitle = "Percentage responded \"Unattractive\" by Activity",
    x = "Percentage",
    y = "Activity" # Y-axis labels are the activity names
  )

