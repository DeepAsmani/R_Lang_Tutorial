####################### Machine Learnong Model Comparison ###########################
# Aim: to compare different predictive models and choose the best one using the tools presented in the previous sections.
# Data used: Customer churn This data from the C50 package and distributes a training set with 3333 samples and a test set containing 1667 samples of customer attrition.

#install.packages("C50")
#install.packages("modeldata")

library("C50")
library("modeldata")
library("caret")
library("glmnet")

# SPlitting data into training & validation
data(mlc_churn, package = "modeldata")
head(mlc_churn)
churnTrain <- mlc_churn[1:3333, ]
churnTest <- mlc_churn[3334:5000, ]


# We want to create a train control object
#  as we want the same folds to be re-used over multiple model training rounds, we are going to pass the train/test splits directly
# These splits are created with the createFolds function, which creates a list (here of length 5) containing the element indices for each fold.

myFolds <- createFolds(churnTrain$churn, k = 5)
str(myFolds)

# Verify that the folds maintain the proportion of yes/no results.

sapply(myFolds, function(i) {
  table(churnTrain$churn[i])/length(i)
})


# We can now a train control object to be reused consistently for different model trainings.

myControl <- trainControl(
  summaryFunction = twoClassSummary,
  classProb = TRUE,
  verboseIter = FALSE,
  savePredictions = TRUE,
  index = myFolds
)

# glmnet model: The glmnet is a linear model with built-in variable selection and coefficient regularisation.
glm_model <- train(churn ~ .,
                   churnTrain,
                   metric = "ROC",
                   method = "glmnet",
                   tuneGrid = expand.grid(
                     alpha = 0:1,
                     lambda = 0:10/10),
                   trControl = myControl)
print(glm_model)
plot(glm_model)

# Apply a random forest model, making sure you reuse the same train control object.
rf_model <- train(churn ~ .,
                  churnTrain,
                  metric = "ROC",
                  method = "ranger",
                  tuneGrid = expand.grid(
                    mtry = c(2, 5, 10, 19),
                    splitrule = c("gini", "extratrees"),
                    min.node.size = 1),
                  trControl = myControl)
print(rf_model)
plot(rf_model)

#Apply a svm model, making sure you reuse the same train control object.

svm_model <- train(churn ~ .,
                   churnTrain,
                   metric = "ROC",
                   method = "svmRadial",
                   tuneLength = 10,
                   trControl = myControl)
print(svm_model)
plot(svm_model)

#Comparing models
# We can now use the caret::resamples function that will compare the models and pick the one with the highest AUC and lowest AUC standard deviation.

model_list <- list(glmmet = glm_model,
                   rf = rf_model,
                   svm = svm_model)
resamp <- resamples(model_list)

resamp

summary(resamp)

lattice::bwplot(resamp, metric = "ROC")