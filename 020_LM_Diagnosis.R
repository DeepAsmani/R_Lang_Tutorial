#+++++++++++++++++++++++++++++++++ Calculate the statistics for diagnosis of Linear regression Model ++++++++++++++++++++++++++++++++++++

# significance of the model (p-value of the model)
# significance of the model's coefficient
# R-squared
# Adjusted R-squared

library("caret")

data(diamonds)
head(diamonds)

#below uses the lm function to model the price of diamonds 
#then predicts the price of these very same diamonds with the predict function.

model <- lm(price ~ carat, diamonds)  # a case of simple regression (as opposed to multiple regresion)
print(model)  # Print Model results

summary(model) # printing the summary statistics for linearMod.

# Significance of the model (p-value of the model): 2.688e+04 on 23 and 53916 DF,  p-value: < 2.2e-16, model is significant (should be less than 0.05)
# significance of the model's coefficient: Pr(>|t|) Pr(>|t|) or p-value is the probability that you get a t-value as high or higher than the observed value when the Null Hypothesis
# (the ?? coefficient is equal to zero or that there is no relationship) is true. So if the Pr(>|t|) is low, the coefficients are significant (significantly different from zero). 
#If the Pr(>|t|) is high, the coefficients are not significant.
# R-Squared, Adjusted R-squared tell us is the proportion of variation in the dependent (response) variable that has been explained by this model. The closer value is to 1, the better.


AIC(model)
BIC(model)
