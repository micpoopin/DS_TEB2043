num = readline("Enter no. of repetitions: ")
num = as.integer(num)

for (i in 1:num){
  print(paste("Number:", i, "and cube of the", i, ":", i^3))
}