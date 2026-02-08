weight = readline("Enter weight(kg): ")
height = readline("Enter height(cm): ")

weight = as.integer(weight)
height = as.integer(height)
height = height/100 #cm to m

bmi = weight/(height ^ 2)

print(paste('Underweight:', bmi <= 18.4))
print(paste('Normal:', bmi <= 24.9 & bmi >= 18.5))
print(paste('Overweight:', bmi <= 39.9 & bmi >= 25.0))
print(paste('Obese:', bmi >= 40.0))