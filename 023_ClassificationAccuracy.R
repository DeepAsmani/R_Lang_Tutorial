###################################### Classification Accuray ################################

# Task 1: to classify mines from rocks using sonar data with  logistic regression classification model use the glm function from the stats package
#Task 2: To test accuracy of classification 
# Sonar data: The Sonar data from the mlbench package can be used to train a classifer to recognise mines from rocks using sonar data. 
# The data is composed to 60 features representing the energy within a particular frequency (image specroscopy) band.

# Install mlbenchm package if needed
#install.packages("mlbench") 

library("mlbench")
data(Sonar)
head(Sonar)

## Assigning 60/40 split for training / validation 
tr <- sample(nrow(Sonar), round(nrow(Sonar) * 0.6))
train <- Sonar[tr, ]
test <- Sonar[-tr, ]

# Performing binominal logistic regression model

model <- glm(Class ~ ., data = train, family = "binomial")  # ?glm  to get help on the model used 
p <- predict(model, test, type = "response")
summary(p)

# Calculate accuracy of prediction based on confision matrix. For this, we would need to assign 0.5 as a threshold, 
# and assign every result with a probability > 0.5 to Yes and No otherwise.
cl <- ifelse(p > 0.5, "M", "R")  # M - mines, R - rocks
table(cl, test$Class)

library("caret") # we need to use 'caret' package, so you should isntall it, if havenot done so yet.
confusionMatrix(factor(cl), test$Class)

# Overall accuracy is the probability that an individual will be correctly classified by a test
# Sensitivity measures the proportion of positives that are correctly identified (i.e. the proportion of those who have some condition (affected) who are correctly identified as having the condition).
# Specificity measures the proportion of negatives that are correctly identified (i.e. the proportion of those who do not have the condition(unaffected) who are correctly identified as not having the condition).

#Compare the model accuracy (or any other metric) using thresholds of 0.1 and 0.9.
confusionMatrix(factor(ifelse(p > 0.1, "M", "R")), test$Class)