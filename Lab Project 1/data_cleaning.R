library(tidyverse)
library(lubridate)

#Load dataset with "latin1" encoding because of pound sterling symbol
df = read_csv("C:/Users/nriza/OneDrive/Desktop/DS_TEB2043/Lab Project 1/Unclean Dataset.csv", 
              locale = locale(encoding = "latin1"),
              show_col_types = FALSE
              )

#Remove empty rows
df = df[rowSums(is.na(df)) != ncol(df), ]

#Separate multiple values of student_id in some rows
df = df %>%
  #Rows that actually contain multiple values in Student_ID
  mutate(has_multiple = str_detect(Student_ID, "\\|")) %>%
  
  #Separate into temp columns
  separate(
    col = Student_ID, 
    into = c("t_ID", "t_First", "t_Last", "t_Age", "t_Gender", "t_Course", "t_Date", "t_Payment"),
    sep = "\\|",
    extra = "drop",
    fill = "right",
    remove = FALSE 
  ) %>%
  
  #replace the real columns if have multiple values.
  mutate(
    Student_ID      = ifelse(has_multiple, t_ID, Student_ID),
    First_Name      = ifelse(has_multiple, t_First, First_Name),
    Last_Name       = ifelse(has_multiple, t_Last, Last_Name),
    Age             = ifelse(has_multiple, t_Age, Age),
    Gender          = ifelse(has_multiple, t_Gender, Gender),
    Course          = ifelse(has_multiple, t_Course, Course),
    Enrollment_Date = ifelse(has_multiple, t_Date, Enrollment_Date),
    Total_Payments  = ifelse(has_multiple, t_Payment, Total_Payments)
  ) %>%
  
  #keep only the standard 8 columns
  select(Student_ID, First_Name, Last_Name, Age, Gender, Course, Enrollment_Date, Total_Payments) %>%
  
  #clear extra white spaces created during the split
  mutate(across(everything(), str_squish))

#separate first and last names, fill missing last names with "NULL"
df = df %>%
  mutate(
    has_space = replace_na(str_detect(First_Name, " "), FALSE),
    Last_Name = ifelse(has_space, word(First_Name, 2, -1), Last_Name),
    First_Name = ifelse(has_space, word(First_Name, 1), First_Name),
    
    Last_Name = ifelse(is.na(Last_Name) | Last_Name == "", "NULL", Last_Name)
  ) %>%
  select(-has_space)

#fix age and gender
df = df %>%
  mutate(
    Temp_Combined = paste(replace_na(Age, ""), replace_na(Gender, "")),
    Age = str_extract(Temp_Combined, "\\d+"),
    Age = as.numeric(Age),
    Gender = str_extract(toupper(Temp_Combined), "M|F")
  ) %>%
  select(-Temp_Combined)

#fix Total_Payments, change datatype to num
df$Total_Payments = gsub("[^0-9.]", "", df$Total_Payments)
df$Total_Payments[df$Total_Payments == ""] = NA 
df$Total_Payments = as.numeric(df$Total_Payments)

#fix Age and Total_Payment
# replace age or total_payment with mean value
df = df %>%
  mutate(
    Age = ifelse(Age < 15 | Age > 100, NA, Age),
    Age = replace_na(Age, round(mean(Age, na.rm = TRUE))),
    
    Total_Payments = replace_na(Total_Payments, round(mean(Total_Payments, na.rm = TRUE), 2))
  )

#fix courses
df = df %>%
  filter(!is.na(Course) & Course != "") %>%
  mutate(
    Course = case_when(
      str_detect(Course, "(?i)Machine") ~ "Machine Learning",
      str_detect(Course, "(?i)Data S")  ~ "Data Science",
      str_detect(Course, "(?i)Data A")  ~ "Data Analytics",
      str_detect(Course, "(?i)Web")     ~ "Web Development",
      str_detect(Course, "(?i)Cyber")   ~ "Cyber Security",
      TRUE ~ Course 
    )
  ) %>%
  filter(Course %in% c("Machine Learning", "Data Science", "Data Analytics", "Web Development", "Cyber Security"))

#remove complete duplicates
df = unique(df)

#remove Student_ID, too much duplicates
df$Student_ID = NULL

#fix Enrollment_Date format, replace blank date with placeholder date
#also make datatype as date
df = df %>%
  mutate(
    Enrollment_Date = parse_date_time(Enrollment_Date, orders = c("ymd", "dmy")),
    Enrollment_Date = as.Date(Enrollment_Date),
    
    Enrollment_Date = coalesce(Enrollment_Date, as.Date("2022-01-01"))
  )