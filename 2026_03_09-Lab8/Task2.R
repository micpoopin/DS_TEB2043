data("HairEyeColor")

#Convert to table (Hair vs Eye)
hair_eye = margin.table(HairEyeColor, c(1, 2))

# Plot stacked bar chart
barplot(
  hair_eye,
  col = c('yellow', 'red', 'brown', 'black'),
  legend = rownames(hair_eye),
  xlab = "Eye Color",
  ylab = "Count",
  main = "Hair and Eye Color"
)

## PIE CHART
# Get total eye color counts
eye_total = margin.table(HairEyeColor, 2)

# Convert to percentages
percent = round(eye_total / sum(eye_total) * 100)

# Create labels with %
labels = paste(names(eye_total), percent, "%")

# Plot pie chart
pie(eye_total,
    labels = labels,
    col = c("brown", "blue", "yellow", "green"),
    main = "Eye Color Distribution (%)")