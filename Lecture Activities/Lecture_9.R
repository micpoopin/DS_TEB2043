#Simple Linear Regression

#data of height
x = c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
#data of weight
y = c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
# Apply the lm function
relation = lm(y~x)
print(relation)

x_test = data.frame(x = 189)
result = predict(relation,x_test)
print(round(result, digit=2))

# Plot the chart
plot(
  x,
  y,
  col = "blue",
  main = "Height & Weight Regression",
  abline(lm(y~x)),
  pch = 16,
  xlab = "Height in cm",
  ylab = "Weight in Kg",
)


#Creating data frame
data1 = data.frame(x,y)
#splitting data into training and testing
data1_train = data1[1:7,]
data1_test = data1[8:10,]
# Apply the lm() function
relation = lm(y~x, data1_train)
print(relation)
#Make prediction
x_text = data.frame(x= data1_test$x)
result = predict(relation,x_text)
print(result)
#Calculate mean absolute percentage error (higher MAPE, lower accuracy)
mape = mean(abs((data1_test$y -result)/data1_test$y)*100)
paste("The error - MAPE is: ", round(mape,digit=2),"%")

#Calculate MAPE 2
actuals_preds = data.frame(cbind(actuals=data1_test$y, predicteds=result))
mape = mean(abs(actuals_preds$actuals - actuals_preds$predicteds )/ actuals_preds$actuals)*100
paste("The error - MAPE is: ", round(mape,digit=2),"%")

library(readr)
df = read.csv("C:/Users/nriza/Downloads/income_happiness.csv")
#Split data into training (80%) and testing (20%) sets
#Randomly select row indices for training
train_indices = sample(1:nrow(df), size = 0.8 * nrow(df))
train_data = df[train_indices, ]
test_data = df[-train_indices, ]
# Apply the lm() function
relation = lm(happiness~income, data=train_data)
print(relation)

# Prediction
a = data.frame(x=test_data$income)
colnames(a) = "income"
result = predict(relation,a)
#Plot
plot(
  test_data$income,
  test_data$happiness,
  col="red",
  abline(lm(happiness~income, data=train_data)),
  pch = 16,
  xlab = "income",
  ylab = "happiness"
)

#built in data
data(mtcars)
head(mtcars)
str(mtcars)

#model the MLR
model <- lm(mpg ~ hp + wt + cyl, data = mtcars)
#invesitigate the properties of the model
summary(model)

#split data into train and test sets
data.train<- mtcars[1:22,]
data.test<- mtcars[23:32,]
#modelling
relation <-lm(mpg ~ hp +wt+cyl, data = data.train)
summary(relation)
# Prediction
a <- data.frame(hp = data.test$hp, wt = data.test$wt, cyl = data.test$cyl)
result <- predict(relation, a)
print(round(result, digits = 2)) 

#Performance Measurement
mape <- mean(abs((data.test$mpg - result)/ data.test$mpg )*100)
paste("The error - MAPE is: ", round(mape,digit=2),"%")

actuals_preds <- data.frame(cbind(actuals=data.test$mpg, predicted=result))
View(actuals_preds )
correlation_accuracy <- cor(actuals_preds)

mape <- mean(abs(actuals_preds$actuals - actuals_preds$predicted)/actuals_preds$actuals)*100
paste("The error - MAPE is: ", round(mape,digit=2),"%")

#CLASS ACTIVITY A

exp_year = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
monthly_salary = c(2500, 2700, 3000, 3400, 3900, 4400, 5000, 5600, 6200, 6900)

data = data.frame(exp_year, monthly_salary)

train_indices = sample(1:nrow(data), size = 0.7 * nrow(data))
data_train = data[train_indices, ] #70%
data_test = data[-train_indices, ] #30%

relation = lm(monthly_salary ~ exp_year, data_train)
print(relation)

x_text = data.frame(x = data_test$exp_year)
result = predict(relation, x_text)
print(result)

plot(
  data_train$exp_year,
  data_train$monthly_salary,
  col = 'red',
  abline(lm(monthly_salary ~ exp_year, data_train)),
  pch = 16,
  xlab = "Experience Year",
  ylab = "Monthly Salary"
)

#CLASS ACTIVITY B

ozone = c(11, 11, 11, 12, 12, 13, 13, 13, 13, 14)
solar.r = c(290, 44, 320, 149, 120, 137, 112, 27, 238, 274)
wind = c(9.2, 9.7, 16.6, 12.6, 11.5, 10.3, 11.5, 10.3, 12.6, 10.9)
temp = c(66, 62, 73, 74, 73, 76, 71, 76, 64, 68)

dataset = data.frame(ozone, solar.r, wind, temp)

train_indices = sample(1:nrow(dataset), size = 0.7 * nrow(dataset))
data_train = dataset[train_indices, ] #70%
data_test = dataset[-train_indices, ] #30%

relation = lm(ozone ~ solar.r+wind+temp, data_train)

a = data.frame(data_train$solar.r, data_train$wind, data_train$temp)
result = predict(relation, a)
print(round(result, 2))