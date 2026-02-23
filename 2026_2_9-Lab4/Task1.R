age = c(55,57,56,52,51,59,58,53,59,55,60,60,60,60,52,55,56,51,60,52,54,56,52,57,54,56,58,53,53,50,55,51,57,60,57,55,51,50,57,58)

age_levels = levels(factor(age))

test = c(age_levels)

for (level in age_levels) {
  test[length(test) + 1] = length(which(age == level))
}

m = matrix(test, ncol = 2)
colnames(m) = c('Staff Age', 'Total')

print(m)

range_factor = cut(
  age,
  breaks = 5,
  labels = c('50-52', '52-54', '54-56', '56-58', '58-60'),
  include.lowest = TRUE,
  right = TRUE
)

range_test = c(levels(range_factor))

for (level in levels(range_factor)) {
  range_test[length(range_test) + 1] = length(which(range_factor == level))
}

m2 = matrix(range_test, ncol = 2)

print(m2)