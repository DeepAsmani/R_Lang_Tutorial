######################################## Random Forest ################################

# Fit model and predict with Random Forest with a package "caret"
# Sonar data: The Sonar data from the mlbench package can be used to train a classifer to recognise mines from rocks using sonar data. 
# The data is composed to 60 features representing the energy within a particular frequency (image specroscopy) band.
# Ranger is a fast implementation of random forests (Breiman 2001) or recursive partitioning, particularly suited for high dimensional data. Classification, regression, and survival forests are supported.

#install.packages("ranger")

library("ranger")
library("mlbench")
library("caret")
data(Sonar)
head(Sonar)


set.seed(12)  # To assure reproduction of the results

## Assigning 60/40 split for training / validation (testing)
tr <- sample(nrow(Sonar), round(nrow(Sonar) * 0.6))
train <- Sonar[tr, ]
test <- Sonar[-tr, ]

model <- train(Class ~ .,
               data = train,
               method = "ranger")

# Print Random Forest model
print(model)

# Print Random Forest model
plot(model)

# The main hyperparameter is mtry, i.e. the number of randomly selected variables used at each split.
# Automate the tuning of the hyperparameter using a grid search, which can be parametrised by setting tuneLength
# TuneLength refers to a number of different values of mtry that are tested

model <- train(Class ~ .,
               data = train,
               method = "ranger",
               tuneLength = 5)
print(model)
plot(model)

p <- predict(model, test, method = "ranger")
confusionMatrix(factor(p), test$Class)

## Variable importance
rf.model <- ranger(Class ~ ., data = Sonar, importance = "impurity")
rf.model$variable.importance
plot(rf.model$variable.importance)
