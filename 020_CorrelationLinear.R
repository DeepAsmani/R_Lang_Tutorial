############################## Correlation (linear) ##########################################

#Correlation is a statistical measure that suggests the level of linear dependence between two variables, that occur in pair 
# Correlation can take values between -1 to +1
# A value closer to 0 suggests a weak relationship between the variables
# A low correlation (-0.2 < x < 0.2) probably suggests that much of variation of the response variable (Y) is unexplained by the predictor (X)

library("ggplot2")

data(diamonds)
head(diamonds)

cor(diamonds$carat, diamonds$price)  # calculate correlation between speed and distance 

#below uses the lm function to model the price of diamonds 
#then predicts the price of these very same diamonds with the predict function.

