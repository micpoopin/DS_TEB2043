print("Check wether a number is Armstrong")

num = readline("Enter a number: ")
num_vec = strsplit(num, "")[[1]]

result = 0

for (digit in num_vec){
  digit = as.integer(digit)
  result = result + (digit ^ 3)
}

if (result == as.integer(num)){
  print(paste(num, "is an Armstrong number."))
} else {
  print(paste(num, "is NOT an Armstrong number."))
}