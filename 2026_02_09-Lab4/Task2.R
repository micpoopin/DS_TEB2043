V1 = c(2,3,1,5,4,6,8,7,9)

rownames = c('row1', 'row2', 'row3')
colnames = c('col1', 'col2', 'col3')

m1 = matrix(V1, nrow = 3, byrow = TRUE, dimnames = list(rownames, colnames))

m2 = t(m1) #transpose matrix 1
dimnames(m2) = list(rownames, colnames) #renames columns and rows

#addition
result = m1 + m2
print("Addition:")
print(result)

#subtraction
result = m1 - m2
print("Substraction:")
print(result)

#multiplication
result = m1 * m2
print("Multiplication:")
print(result)

#division
result = m1 / m2
print("Division:")
print(result)