library(lattice)
library(ggplot2)
library(reshape2)
library(dplyr)

data = ToothGrowth
data = data %>% select(len, dose)

##PLOTTING CORRELATION WITH HEATMAP
corr_mat = round(cor(data),2)

# reorder corr matrix using corr coefficient as distance metric
dist = as.dist((1-corr_mat)/2)

# hierarchical clustering the dist matrix
hc = hclust(dist)
corr_mat = corr_mat[hc$order, hc$order]

# reduce the size of correlation matrix
melted_corr_mat = melt(corr_mat)

ggplot(
  data = melted_corr_mat,
  aes(x=Var1, y=Var2, fill=value)) + geom_tile() + geom_text(aes(Var2, Var1, label = value),
  color = "white", size = 4
)