student_data = list(c(), c())
names(student_data) = c('name', 'score')

for (i in 1:10) {
  name = readline('Student name: ')
  score = readline('Student score: ')
  score = as.integer(score)
  
  student_data$name[i] = name
  student_data$score[i] = score
}

highest_score = max(student_data$score)
lowest_score = min(student_data$score)

print(paste('Highest Score:', highest_score))
print(paste('Lowest Score:', lowest_score))
print(paste('Average Score:', mean(student_data$score)))

cat('Student with highest Score:', paste(student_data$name[which(student_data$score==highest_score)], collapse = ', '), "\n")
cat('Student with lowest Score:', paste(student_data$name[which(student_data$score==lowest_score)], collapse = ', '), "\n")