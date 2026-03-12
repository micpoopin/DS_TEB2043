library(dplyr)

titanic = read.csv("C:/Users/nriza/OneDrive/Desktop/DS_TEB2043/2026_03_09-Lab8/titanic.csv")
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

#Insights
survivors = filter(titanic_cleaned, Survived == 1)

survived = nrow(survivors)
total = nrow(titanic_cleaned)
survival_rate = (survived/total) * 100
print(paste(survived, "survived from", total))
print(paste("Survival Rate is", round(survival_rate), "%"))

female = sum(survivors$Sex == "female")
male = sum(survivors$Sex == "male")

test = pie(c(male, female), labels = c('Male', 'Female'), main = 'Titanic Survivor Based on Gender', col = c('blue', 'pink'))
