##################################################### Non-linear regressions: Polynomial regression #####################################
#Boston data set [in MASS package for predicting the median house value (mdev), 
#in Boston Suburbs, based on the predictor variable lstat (percentage of lower status of the population).


# Loading Required R packages
library(tidyverse)
library(caret)
theme_set(theme_classic()) # Selecting R theme for better visualisation

# Load the data
data("Boston", package = "MASS")
head(Boston)

# Split the data into training and test set
set.seed(123)
training.samples <- Boston$medv %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- Boston[training.samples, ]
test.data <- Boston[-training.samples, ]

#First, visualize the scatter plot of the medv vs lstat variables as follow:
#median house value (mdev)
#lstat (percentage of lower status of the population)
ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth()
#The above scatter plot suggests a non-linear relationship between the two variables

#Polynomial regression adds polynomial or quadratic terms to the regression equation as follow: medv=b0+b1???lstat+b2???lstat2

# Compute a 2-order polynomial fit:

lm(medv ~ poly(lstat, 2, raw = TRUE), data = train.data) %>%  # argument '2' refers to 2-order polynomial fit
summary()

#a sixfth-order polynomial fit:
lm(medv ~ poly(lstat, 6, raw = TRUE), data = train.data) %>%
  summary()
#polynomial terms beyond the fith order are not significant
#so, just create a fith polynomial regression model as follow:
# Build the model
model <- lm(medv ~ poly(lstat, 5, raw = TRUE), data = train.data)
# Make predictions
predictions <- model %>% predict(test.data)
# Model performance
data.frame(
  RMSE = RMSE(predictions, test.data$medv),
  R2 = R2(predictions, test.data$medv)
)

#Visualize the fith polynomial regression line as follow:
ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))