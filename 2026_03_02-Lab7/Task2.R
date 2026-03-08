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

#Insights
survivors = filter(titanic_cleaned, Survived == 1)

survived = nrow(survivors)
total = nrow(titanic_cleaned)
survival_rate = (survived/total) * 100
print(paste(survived, "survived from", total))
print(paste("Survival Rate is", round(survival_rate), "%"))

female = sum(survivors$Sex == "female")
male = sum(survivors$Sex == "male")

print(paste(female, "female survivors and", male, "male survivors"))
print("Majority of survivors are female")

pclass1 = sum(survivors$Pclass == 1)
pclass2 = sum(survivors$Pclass == 2)
pclass3 = sum(survivors$Pclass == 3)

survivors_pclass = data.frame(Class1 = pclass1, Class2 = pclass2, Class3 = pclass3, row.names = c("Survivors"))
print(survivors_pclass)

print(paste("Majority of survivors are from passenger class 1"))