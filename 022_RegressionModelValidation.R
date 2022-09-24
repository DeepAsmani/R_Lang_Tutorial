####################### Prediction model evaluation: out-of-sample RMSE #############################


library("caret")

data(diamonds)

#Let's create a random 80/20 split to define the test and train subsets.

set.seed(42)    # to ensure repeatability        
ntest <- nrow(diamonds) * 0.80            # create a random 80/20 split
test <- sample(nrow(diamonds), ntest)     # create a random 80/20 split

#Train the model on the testing (80%) data.
model <- lm(price ~ ., data = diamonds[test, ])

#  predicts the price of these very same diamonds with the predict function on the remaining 20% of data
p <- predict(model, diamonds[-test, ]) # Predicting with the linear Model

# Test the model on the testing data and Calculate RMSE on the testing data
error <- p - diamonds$price[-test]
rmse_out <- sqrt(mean(error^2)) ## out-of-sample RMSE
rmse_out
