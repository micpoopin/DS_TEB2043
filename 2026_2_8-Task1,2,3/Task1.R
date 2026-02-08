score = c()

for (i in 1:20) {
  input = readline(paste('Student', i, 'score: '))
  input = as.integer(input)
  print(paste('Passed:', input >= 49))
  score[i] = input
}

print(paste("A:", sum(score >= 90)))
print(paste("B:", sum(score >= 80 & score <= 89)))
print(paste("C:", sum(score >= 70 & score <= 79)))
print(paste("D:", sum(score >= 60 & score <= 69)))
print(paste("E:", sum(score >= 50 & score <= 59)))
print(paste("F:", sum(score <= 49)))