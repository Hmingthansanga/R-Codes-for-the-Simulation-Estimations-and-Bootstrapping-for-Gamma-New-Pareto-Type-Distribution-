# Let N be the number of bootstrap samples
N <- 1000

# Input the data
data<- c()

# Initialize a data frame for storing the samples
bootstrap_dataframe <- data.frame(matrix(NA, nrow = length(data), ncol = 0))

# Resampling and storing in the dataframe
for (i in 1:N){
samples <- sample(data, length(data), replace=T)

bootstrap_dataframe[, paste0("sample_", i)] <- samples
  }

bootstrap_dataframe