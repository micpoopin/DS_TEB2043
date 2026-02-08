student_data[3] = c(0)
names(student_data)[2:3] = c('Chemistry', 'Physics')

for (i in 1:length(student_data$name)) {
  score = readline(paste(student_data$name[i], 'Physics Score: '))
  score = as.integer(score)
  student_data$Physics[i] = score
}

failed_chem = length(which((student_data$Chemistry <= 49)))
failed_phy = length(which((student_data$Physics <= 49)))

print(paste('Failed Chemistry:', failed_chem))
print(paste('Failed Physics:', failed_phy))

highest_chem_score = max(student_data$Chemistry)
highest_phy_score = max(student_data$Physics)

cat(
  "Highest Chemistry Score:",
  paste(student_data$name[which(student_data$Chemistry == highest_chem_score)], collapse = ', '),
  '\n'
)

cat(
  "Highest Physics Score:",
  paste(student_data$name[which(student_data$Physics == highest_phy_score)], collapse = ', '),
  '\n'
)