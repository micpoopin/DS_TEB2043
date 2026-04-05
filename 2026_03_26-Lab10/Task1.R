#build lm model
lm_model = lm(Dose ~ Wt, data = Theoph)

#Visualize
plot(
  Theoph$Dose,
  Theoph$Wt,
  col = "blue",
  main = "Dose & Weight Regression",
  abline(lm_model),
  cex = 1.3,
  pch = 16,
  xlab = "Weight (kg)",
  ylab = "Dose (mg/kg)"
)

#Predict
weight = data.frame(Wt = c(90, 95, 100))
predictions = predict(lm_model, weight)

result = data.frame(
  Wt = c(90, 95, 100),
  Dose = round(predictions, 2)
)

print(result)