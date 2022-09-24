######################################## Decision Trees ################################

# Fit and predict with Regression Trees with a package "rpart"
#Breiman L., Friedman J. H., Olshen R. A., and Stone, C. J. (1984) Classification and Regression Trees. Wadsworth.
# Sonar data: The Sonar data from the mlbench package can be used to train a classifer to recognise mines from rocks using sonar data. 
# The data is composed to 60 features representing the energy within a particular frequency (image specroscopy) band.

#install.packages("rpart")
#install.packages("rpart.plot")

library("mlbench")
data(Sonar)
head(Sonar)

# Let's fit a Regression Trees model

library("rpart") ## recursive partitioning
m <- rpart(Class ~ ., data = Sonar,
           method = "class")


library("rpart.plot")
rpart.plot(m)

# Let's use a fitted Regression Trees model for prediction
p <- predict(m, Sonar, type = "class")
summary(p)
table(p, Sonar$Class)  # Option 1: Confusion Matrix to check accuracy

# Option 2: Using caret packgae for accuracy assessment
library("caret") # we need to use 'caret' package, so you should isntall it, if havenot done so yet.
confusionMatrix(factor(p), Sonar$Class)


