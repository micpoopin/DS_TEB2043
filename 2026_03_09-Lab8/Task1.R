library(dplyr)

titanic = read.csv("C:/Users/nriza/OneDrive/Desktop/DS_TEB2043/2026_03_09-Lab8/titanic.csv")
print(colSums(is.na(titanic)))

#Rename column
titanic_cleaned = titanic %>% rename("SiblingSpouse" = "SibSp")

#Change name from num to int
titanic_cleaned$Age = as.integer(titanic_cleaned$Age) 

#Replace NA age with mean age
age_mean = as.integer(mean(titanic_cleaned$Age, na.rm = TRUE))
titanic_cleaned$Age[is.na(titanic_cleaned$Age)] = age_mean

## Insights
survivors = filter(titanic_cleaned, Survived == 1)

# Pie Chart
female = sum(survivors$Sex == "female")
male = sum(survivors$Sex == "male")
gender_survivor = c(male, female)

pie(gender_survivor, labels = gender_survivor, main = "Titanic Survivor by Gender", col = c('blue', 'pink'))
legend("topright", c("Male", "Female"), cex = 0.8, fill = c('blue', "pink"))

# Bar Chart
pclass1 = sum(survivors$Pclass == 1)
pclass2 = sum(survivors$Pclass == 2)
pclass3 = sum(survivors$Pclass == 3)

pclass_survivor = c(pclass1, pclass2, pclass3)

barplot(
  pclass_survivor,
  names.arg = c("Class 1, Class 2, Class 3"),
  xlab = "Class",
  ylab = "Survivors",
  col = "green",
  main = "Titanic Survivors by Class"
)