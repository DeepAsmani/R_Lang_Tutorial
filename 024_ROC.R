###################################### Receiver operating characteristic (ROC) curve ################################

# To test different classification thresholds by automation of the calculation of the TP and FP rates 
# at each threshold and visualise all results along a ROC curve.
# ANalyze AUC: area under the curve 
# Sonar data: The Sonar data from the mlbench package can be used to train a classifer to recognise mines from rocks using sonar data. 
# The data is composed to 60 features representing the energy within a particular frequency (image specroscopy) band.

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

# Calculate ROC & AUC with the colAUC function from the caTools package:
#install.packages("caTools")

library("caTools")
caTools::colAUC(p, test[["Class"]], plotROC = TRUE)

#ROC: each point along the curve represents a confusion matrix for a given threshold'

# AUC s single number metric, summarising the model performance along all possible thresholds:
# an AUC of 0.5 corresponds to a random model
# values > 0.5 do better than a random guess
# a value of 1 represents a perfect model
# a value 0 represents a model that is always wrong

