library(dplyr)
library(readr)

student_data = read.csv("C:/Users/nriza/Downloads/student_data.csv")

#Introduction
View(student_data)
summary(student_data)
head(student_data)
tail(student_data)

#filter
student_fail = student_data %>% filter(final_exam_mark < 40)

#arrange
mydata = student_data %>% arrange(final_exam_mark) #by default ascending
mydata = student_data %>% arrange(desc(final_exam_mark)) #descending

#select
mydata2 = student_data %>% select(student_id, coursework_mark, final_exam_mark)

glimpse(mydata2) #show info for data frame

#mutate
mydata3 = student_data %>% mutate(total_Mark = (coursework_mark + final_exam_mark)/200 * 100)
View(mydata3)

mydata4 = cbind(student_data, total_mark = (student_data$coursework_mark + student_data$final_exam_mark)/200 * 100)
View(mydata4)

#Descriptive Statistics
data = iris
View(data)

str(data) #structured

summary(data)

#min and max
min(data$Sepal.Length)
max(data$Sepal.Length)

#std deviation and variance
sd(data$Sepal.Length)
var(data$Sepal.Length)

quantile(data$Sepal.Length)
sort(data$Sepal.Length)

#Histogram Sepal Lemgth
hist(
  data$Sepal.Length,
  main = "Histogram of Sepal Length",
  xlab = "Sepal Length (cm)",
  ylab = "Frequency",
  col = "lightblue",
  border = "black"
  )

#boxplot
boxplot(
  data$Sepal.Length ~ data$Species,
  main = "Sepal Length by Species",
  xlab = "Species",
  ylab = "Sepal Length (cm)",
  col = c("lightgreen", "lightpink", "lightyellow")
)

#scatter plot
plot(
  data$Sepal.Length,
  data$Petal.Length,
  main = "Sepal Length vs Petal Length",
  xlab = "Sepal Length (cm)",
  ylab = "Petal Length (cm)",
  col = as.numeric(data$Species),
  pch = 19
)

legend(
  "topleft",
  legend = levels(data$Species),
  col = 1:3,
  pch = 19
)

#Outliers
dfplayers = read.csv("C:/Users/nriza/Downloads/players.csv")
View(dfplayers)

median_age = median(dfplayers$Age, na.rm = TRUE)

dfplayers$age[dfplayers$age < 18 | dfplayers$age > 38] = median_age
View(dfplayers)

#Identifying Outliers
data = c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)
boxplot(data, main = "Boxplot")

first_q = quantile(data, 0.25)
third_q = quantile(data, 0.75)

iqr = IQR(data)

le = first_q - (1.5 * iqr)
ue = third_q + (1.5 * iqr)

#Drop outliers
data_new = data
data_new = data_new[!data_new < le]
data_new = data_new[!data_new > ue]
View(data_new)

#Replace outliers with mean
data_new = data
avg = round(mean(data_new))
data_new[data_new < le] = avg
data_new[data_new > ue] = avg

#Replace outliers with le or ue
data_new = data
avg = round(mean(data_new))
data_new[data_new < le] = le
data_new[data_new > ue] = ue

boxplot(data_new, main = "Boxplot")