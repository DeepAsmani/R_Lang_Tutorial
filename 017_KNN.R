############################################## k nearest neighbors algorithm ######################

#Typically in machine learning, there are two clear steps, 
#where one first trains a model and then uses the model to predict new outputs (class labels in this case).
#In the kNN implementation in R, these two steps are combined into a single function call to knn.

#install.packages("class")

library("class")

data(iris)
head(iris) # have a look at data


#Lets draw a set of 50 random iris observations to train the model and predict the species of another set of 50 randomly chosen flowers. 
set.seed(120)
tr <- sample(150, 50)
nw <- sample(150, 50)

#The knn function takes the training data, the new data (to be classified) 
#and the labels of the training data, and returns (by default) the predicted class.

knnres <- knn(iris[tr, -5], iris[nw, -5], iris$Species[tr])
head(knnres)


#compare the observed kNN-predicted class and the expected known outcome and calculate the overall accuracy of our model.

table(knnres, iris$Species[nw])

#Compute Overall Accuray of KNN prediction
mean(knnres == iris$Species[nw])

#arguments of the KNN function
args(knn)

#parameter k of the classifier. 
#This parameter defines how many nearest neighbours will be considered to assign a class to a new unlabelled observation


#Assignment
#Repeat the kNN classification above by using another value of k, and compare the accuracy of this new model to the one above. 
#Make sure to use the same tr and nw training and new data to avoid any biases in the comparison.