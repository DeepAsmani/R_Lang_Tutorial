################################################ Spline regression ###############################################
# Splines provide a way to smoothly interpolate between fixed points, called knots. 
#Polynomial regression is computed between knots. In other words, splines are series of polynomial segments strung together, joining at knots 
#Boston data set [in MASS package for predicting the median house value (mdev), 
#in Boston Suburbs, based on the predictor variable lstat (percentage of lower status of the population).


# Loading Required R packages
library(tidyverse)
library(caret)
library(splines)
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

# Let's do spline regression

#The R package splines includes the function bs for creating a b-spline term in a regression model.
# In bs function, You need to specify two parameters: the degree of the polynomial and the location of the knots.
#We'll place the knots at the lower quartile, the median quartile, and the upper quartile:

#We'll create a model using a cubic spline (degree = 3):
library(splines)
# Build the model
knots <- quantile(train.data$lstat, p = c(0.25, 0.5, 0.75))
model <- lm (medv ~ bs(lstat, knots = knots), data = train.data)
# Make predictions
predictions <- model %>% predict(test.data)
# Model performance
data.frame(
  RMSE = RMSE(predictions, test.data$medv),
  R2 = R2(predictions, test.data$medv)
)
#Note that, the coefficients for a spline term are not interpretable.
#Visualize the cubic spline as follow:
ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth(method = lm, formula = y ~ splines::bs(x, df = 3))
