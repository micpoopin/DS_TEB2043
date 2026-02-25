year = readline("Enter a year: ")
year = as.integer(year)

if (year %% 4 == 0 & year %% 100 == 0 & year %% 400 == 0){
  print(paste(year, "is a leap year!"))
} else {
  print(paste(year, "is NOT a leap year!"))
}