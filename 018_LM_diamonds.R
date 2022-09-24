######################## Linear regression analysis in R  - graphiCAL ANALYSIS###########################

#Linear regression is used to predict the value of an outcome variable Y based on one or more input predictor variables X. 
# so that we can use this regression model to predict the Y when only the X is known. 

#Data The diamonds data ships with the ggplot2 package and predict the price (in US dollars) of about 54000 round cut diamonds.

#install.packages("caret")

library("caret")
library("ggplot2")

data(diamonds)
head(diamonds)

#Scatter plots can help visualize any linear relationships between the dependent (response) variable 
#and independent (predictor) variables.

scatter.smooth(x=diamonds$carat, y=diamonds$price, main="CARAT ~ PRICE")  # scatterplot

# LIENAR RELATIONSHIP BETWEEN cARAT AND pRICE OF DIAMONDS'
#if you are having multiple predictor variables, 
#a scatter plot is drawn for each one of them against the response, along with the line of best as seen below.

# More checks - BoxPlot - Check for outliers in Carat and Price

par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(diamonds$carat, main="carat", sub=paste("Outlier rows: ", boxplot.stats(diamonds$carat)$out))
boxplot(diamonds$price, main="price", sub=paste("Outlier rows: ", boxplot.stats(diamonds$price)$out))

# Density Plots - Check if the response variable is close to normality

library(e1071)
par(mfrow=c(1, 2))  # divide graph area in 2 columns
plot(density(diamonds$carat), main="Density Plot: Carat", ylab="Frequency", sub=paste("Skewness:", 
                                                  round(e1071::skewness(diamonds$carat), 2)))  # density plot for 'carat'
polygon(density(diamonds$carat), col="red")

# density plot for 'dist'
plot(density(diamonds$price), main="Density Plot: Price", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(diamonds$price), 2)))  
polygon(density(diamonds$price), col="red")


#below uses the lm function to model the price of diamonds 
#then predicts the price of these very same diamonds with the predict function.

#data(diamonds)
model <- lm(price ~ ., diamonds)
model #print results
p <- predict(model, diamonds)
p     #print results

