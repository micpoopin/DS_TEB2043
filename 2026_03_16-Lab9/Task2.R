library(caret)
library(dplyr)

mydata = mtcars %>% select(mpg)

# normalize with log transformation
scaled_data1 = log(mydata)
print(scaled_data1)

# normalize with standard scalling
scaled_data2 = as.data.frame(scale(mydata))
print(scaled_data2)

# normalize with min-max scalling
minmax = preProcess(as.data.frame(mydata), method=c("range"))
scaled_data3 = predict(minmax, as.data.frame(mydata))
print(scaled_data3)

# summary for each methods
summary(scaled_data1)
summary(scaled_data2)
summary(scaled_data3)