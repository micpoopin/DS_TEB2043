library(dplyr)

titanic = read.csv("titanic.csv")
print(colSums(is.na(titanic)))

#Rename column
titanic_cleaned = titanic %>% rename("SiblingSpouse" = "SibSp")

#Change name from num to int
titanic_cleaned$Age = as.integer(titanic_cleaned$Age) 

#Replace NA age with mean age
age_mean = as.integer(mean(titanic_cleaned$Age, na.rm = TRUE))
#print(age_mean)
titanic_cleaned$Age[is.na(titanic_cleaned$Age)] = age_mean
print(colSums(is.na(titanic_cleaned)))