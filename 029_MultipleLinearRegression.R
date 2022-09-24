################################################Multiple Linear Regression ######################################
#we'll build a multiple regression model to predict sales based on the budget invested in three advertising medias: youtube, facebook and newspaper. 
#The formula is as follow: sales = b0 + b1*youtube + b2*facebook + b3*newspaper

#tidyverse for easy data manipulation and visualization
#caret for easy machine learning workflow
#Marketing data: for predicting sales units on the basis of the amount of money spent in the three advertising medias (youtube, facebook and newspaper)

install.packages("tidyverse")
install.packages("datarium") # marketing data set
library(tidyverse)
library(caret)
library(datarium)
theme_set(theme_bw())

# Load the data
data("marketing", package = "datarium")
# Inspect the data
sample_n(marketing, 3)
head(marketing)

# Split the data into training and test set
set.seed(123)
training.samples <- marketing$sales %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- marketing[training.samples, ]
test.data <- marketing[-training.samples, ]

#Multiple linear regression
#Multiple linear regression is an extension of simple linear regression for predicting an outcome variable (y) on the basis of multiple distinct predictor variables (x).
#equation with three predictor variables (x): y = b0 + b1*x1 + b2*x2 + b3*x3
# ?- coefficients shows the average effect on y of a one unit increase in "x_j", holding all other predictors fixed.

#Let's make a multiple linear model
# Estimate: the intercept (b0) and the beta coefficient estimates associated to each predictor variable

model <- lm(sales ~ youtube + facebook + newspaper, 
            data = train.data)
summary(model)$coef

#Std.Error: the standard error of the coefficient estimates. This represents the accuracy of the coefficients. The larger the standard error, the less confident we are about the estimate.
#t value: the t-statistic, which is the coefficient estimate (column 2) divided by the standard error of the estimate (column 3)
#Pr(>|t|): The p-value corresponding to the t-statistic. The smaller the p-value, the more significant the estimate is.

#It can be seen that, changing in youtube and facebook advertising budget are significantly associated to changes in sales; 
#changes in newspaper budget is not significantly associated with sales.

#Model summary before doing predictions

summary(model)

#Call. Shows the function call used to compute the regression model.
#Residuals. Provide a quick view of the distribution of the residuals, which by definition have a mean zero. Therefore, the median should not be far from zero, and the minimum and maximum should be roughly equal in absolute value.
#Coefficients. Shows the regression beta coefficients and their statistical significance. Predictor variables, that are significantly associated to the outcome variable, are marked by stars.
#Residual standard error (RSE), R-squared (R2) and the F-statistic are metrics that are used to check how well the model fits to our data.

#In our example, the adjusted R2 is 0.88, which is good.
#A large F-statistic will corresponds to a statistically significant p-value (p < 0.05). In our example, the F-statistic equal 451 producing a p-value of 1.46e-42, which is highly significant.



##### You can easily make predictions using the R function predict():

# Make predictions
predictions <- model %>% predict(test.data)
# Model performance
# (a) Compute the prediction error, RMSE
RMSE(predictions, test.data$sales)

# (b) Compute R-square
R2(predictions, test.data$sales)

#The above equation, also known as additive model, investigates only the main effects of predictors. 
#It assumes that the relationship between a given predictor variable and the outcome is independent of the other predictor variables