library(e1071)
library(caTools)
library(class)

data(ChickWeight)

# Splitting data into train and test data
split = sample.split(ChickWeight, SplitRatio = 0.7)
train_cl = subset(ChickWeight, split == "TRUE")
test_cl = subset(ChickWeight, split == "FALSE")

# Feature Scaling
train_scale = scale(train_cl[, 1:2])
test_scale = scale(test_cl[, 1:2])

k_val = 1:20
acc = numeric(length(1:20))

for (i in 1:20){
  classifier_knn = knn(
    train = train_scale,
    test = test_scale,
    cl = train_cl$Diet,
    k = i
  )
  
  # Calculate out of Sample error
  misClassError = mean(classifier_knn != test_cl$Diet)
  acc[i] = 1 - misClassError
}

print(paste("Optimal K:", k_val[which.max(acc)]))