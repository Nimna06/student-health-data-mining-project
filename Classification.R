library(tidyverse)
library(caret)
library(rpart)

#Load the dataset
getwd()
df =read.csv("C:/Users/USER/Downloads/Australian_Secondary_School_Students_Alcohol_and_Drug__ASSAD__Survey_-_dashboard.csv")
head(df)

# Selecting relevant columns
columns_to_use <- c("Data.name", "Estimate", "Standard.error", "Lower.95..CI", "Upper.95..CI", "Relative.standard.error", "Year", "Gender", "Age")
df <- df[, columns_to_use] %>% drop_na()

# Encoding categorical variables
df$Year <- as.factor(df$Year)
df$Gender <- as.factor(df$Gender)
df$Age <- as.factor(df$Age)
df$Data.name <- as.factor(df$Data.name)

# Splitting data into training and testing sets
set.seed(42)
trainIndex <- createDataPartition(df$Data.name, p = 0.8, list = FALSE)
train_data <- df[trainIndex, ]
test_data <- df[-trainIndex, ]

# Training the Decision Tree model
model <- rpart(Data.name ~ ., data = train_data, method = "class")

# Predictions
predictions <- predict(model, test_data, type = "class")

print(table(predictions))  # Check predicted values
print(table(test_data$Data.name))  # Check actual values
print(length(predictions) == length(test_data$Data.name))  # Should return TRUE

library(caret)
conf_matrix <- confusionMatrix(predictions, test_data$Data.name)

# Evaluation
conf_matrix <- confusionMatrix(predictions, test_data$Data.name)
print(conf_matrix)

