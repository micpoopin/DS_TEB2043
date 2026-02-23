name = readline("Enter your name: ")
phone_number = readline("Enter your phone number: ")

print(paste(
  "Hi",
  toupper(name),
  ". A verification code has been sent to",
  str_sub(phone_number, 1, 3), #str_sub from stringr libraries
  "-xxxxx",
  str_sub(phone_number, -4, -1)
))