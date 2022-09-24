
# R Crash Course / Kate Alison / all rights reserved

# 1. Package Management


install.packages("ggplot2")

library(ggplot2)

ggplot2::ggplot()

# hashtags allow for making comments and remarks
# these lines will not be exexcuted 

# 2. Calculate with R

5+10

34 - 22

27 / 9

6 * 8

(2 + 3) * 4

# Operators R can work with

#         ?            help function
#     + - / * ^        addition, subtraction, division, multiplication, potentiation
#         !            negation sign
#   < > <= >= == !=    lesser, greater, lesser or equal, greater or equal, equal, not equal
#        & |           boolean AND, boolean OR
#        <-            variable assignment
#         ~            seperate left- an right-hand sides in a model formula
#         :            generate regular sequences
#        %%            modulo
#   [] [[]] $ @        indexing in vectors, matrices and data frames

# 3. Variables

x <- 8 + 7            # assignment to variable x

y <- 4 * 2            # assignment to variable y

x

y

x + y 

my.variable <- x +y  # convention to assign points to variables for clarity reasons

my.variable

# 4a. Variables
num <- 33.33 #By assigning a decimal value to a variable num, num will be of numeric type.
num
class(num)

#Even if we assign an integer to a variable iteg, it is still being saved as a numeric value.
iteg <- 33
iteg
class(iteg)

# Assign integer
iteg <- 50L
iteg
class(iteg)

iteg2 <- as.integer(25)
iteg2
class(iteg2)

iteg2 <- as.integer(5.55)
iteg2
class(iteg2)

#Logical
x <- 100
y <- 200   # sample values 

z <- x > y 
z 
class(z)

#Character
chr <- "R"
class(chr)

p <- as.character(3.14)
class(p)

#There are many functions available to work on character objects.
#Two character values can be concatenated with the paste() or the paste0() function.

first <- "ANgela"
last <- "Merkel"
paste(first, last)

paste0(last, first)
#Many more functions for string manipulation are available (see for example the stringr package).

#FACTORS
weather <- factor(c("rainy", "sunny", "sunny", "rainy"))
weather
str(weather) #R will assign 1 to the level "rainy" and 2 to the level "sunny". We can check this by using the str() function:

#Maintaining order for factors
flood.level <- factor(c("low", "high", 
                        "medium", "high", 
                        "low", "medium"),
                      levels = c("low", "medium", "high"), 
                      ordered = TRUE)
min(flood.level)
max(flood.level)


# 4b. Functions

sqrt(64)       # square root

exp(3)         # exponential

cos(13)        # cosinus

pi             # constant number pi

round(pi)      # round values

a <- 6

b <- 9.2

log10(a + b)  # logarithm (base 10)

# basic conctruct of a function

# name.of.fun(arguments) {body}

# function that calculates normalized ratio of two numeric values

my.fun <- function(var1, var2) {
  x <- (var1 - var2) / (var1 + var2)
  return (x)
}

result <- my.fun(42, 13)

result


# 5. Vectors

# Four main structure types in R

# vectors
# matrices
# lists
# data frames

# conversion

# as.vector()
# as.matrix()
# as.list()
# as.data.frame()

# Six atmoic vector types in R

# class               examples

# character           "time", "space", "R is a lot of fun!"
# numeric/double      3, -8, -14.4, 56.8
# integer             5, 9, 23, 654
# logical             TRUE, FALSE
# complex             1 + 2i, 3 - 6i
# raw                 raw sequences of bytes


# Declaring of factors with C() and checking the vector type


a <- c("Hello", "World")   # character/string
class(a)

b      # numeric
class(b)

c <- c(42L, 99L, 46L)       # integer
class(c)

d <- c(TRUE, TRUE, FALSE)   # logical
class(d)

e <- c(1 + 2i, 3-6i)        # complex
class(e)

length(a)                   # get number of elements in vector


# R is object-oriented
# objects have properties or attributes

# column names
# dimensionality
# length or class membership
# many more

# Several class combined in one vector automatically are transformed in uniform class

ab <- c("Hello", 1.3, "World", 5.6)
class(ab)

ab

cd <- c(TRUE, 45L, FALSE, 13L)
class(cd)

cd

# conversions between classes are possible
# when convert character to numeric NA (Not available) introduced

x <- c(0L, 1L, 2L, 3L, 4L, 5L)
x

x <- as.character(x)
x

y <- c("R", "is", "fun")
y

y <- as.numeric(y)

y


# Indexing in Vectors

# in R indexing by using []
# counting starts at -1
# first element with [1]
# minus sign = exclusion

x <- c(4, 2, 7, 9, 3)
x

x[1]        # first element

x[-3]       # all but third element

x[2:4]      # all elements from second to fourth entry

x[c(2, 5)]  # only the second and fifth element


# Calculate with Vectors

# numerical vectors calculated element by element
# eg. vector multiplied with 5 => vector of same length, each element multiplied by 5

v1 <- c(1, 3, 5, 7)

v1 * 5

v1 + 100


# calculation of two vectors of same length
# computation of each element of one vector with element of other vector in stringent order

v1 <- c(1, 3, 5, 7)
v2 <- c(20, 40, 60, 80)

v1 + v2

v2 * v1


# Vectors of different lenghts
# shorter is recycled until length of other is reached

v3 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
v4 <- c(10, 1)

v3 + v4

# useful implemented functions in R

v5 <- c(2 , 4, 6, 8, 1, 3)

mean(v5)      # arithmetisches Mittel

median(v5)    # median

max(v5)       # maximum value

min(v5)       # minimum value

sum(v5)       # sum of all elements

quantile(v5)  # quantiles

var(v5)       # variance

sd(v5)        # standard variation

sort(v5, decreasing=TRUE)   # sort elements


# Factors

# another class when working with datasets
# represent categorical data
# strings automatically converted to factors

# unordered factor vector 

fa <- factor( c("good", "bad", "bad", "bad", "good", "good"))

class(fa)

fa

str(fa)

as.integer(fa)

levels(fa)


# 6. Matrices

# matrix is a 2D structure
# only elements of single class
# created via matrix(), nrows, ncol

m <- matrix(1:6, nrow = 3, ncol = 2)
m

length(m)     # show number of elements in matrix

dim(m)        # shows nrow and ncol attributes


# matrices can be constructed by dim()

a <- 1:16
a

dim(a) <- c(2, 8)
a

# connection of two vectors via cbind() or rbind()

x <- c(23, 44, 15, 12)
y <- c(1, 2, 3, 4)

b <- cbind(x, y)
b

c <- rbind(x, y)
c


# Indexing in vectors
# behaves adeqautetly to indexing in vectors
# index numbers in [], rows and clomuns seperated by , 

m <- matrix(1:15, nrow = 5, ncol = 3)
m

m[, 2]        # extract second column

m[3, ]        # extract third row

m[1, c(2, 3)] # elements of first row in second and third column


# matrices can be multiplied by single value or element by element
# matrices need same dimensionality

m1 <- matrix(1:8, nrow = 2)
m1

m1 * 5

m1 * m1


# useful and commonly used functions

m2 <- matrix(1:6, nrow = 2)
m2

colMeans(m2)          # mean of all columns

colSums(m2)           # sum of all columns

rowMeans(m2)          # mean of all rows 

rowSums(m2)           # sum of all rows

t(m2)                 # transpose a matrix

m3 <- matrix(1:6, ncol = 2)
m3 %*% m2             # matrix multiplication


# 7. Lists

# special form of vector
# multiple elements of different classes
# created by lis()
# element names by names()

l <- list(13L, "Hello", matrix(1:6, 2, 3))
l

names(l)<- c("my.integer", "my.string", "my.matrix")
l

str(l)

# When creating lists, element names can be assigned immediately

l <- list("my.integer"= 13L,
          "my.string"="Hello",
          "my.matrix"= matrix(1:6, 2, 3))
l


# Indexing in lists

# use [[]] to access contents of list

l[1]                # first part of list
class(l[1])

l[[1]]              # extract first element (integer value)
class(l[[1]]) 

l[["my.string"]]    # extract element by its name

l[[3]]              # extract third element (matrix)


# Modify lists

# lists can be expanded, elements deletetd or overwrite

l["my.numeric"] <- 45.7325        # add new element to list

l[1] <- NULL                      # delete first element in list

l["meinString"] <- "World"        # overwrite existing element


# 8. Dataframe

# Most commonly used data type when manipulating databases
# Allows to manage 2D tabular data
# Several classes can exist in dataframe
# Columns basically lists

df <- data.frame(
  "name"   = c("Ben", "Hanna", "Paul", "Arthur"),
  "size"   = c(185, 166, 175, 190),
  "weight" = c(110, 60, 76, 89)
)

df

length(df)          # number of columbns (variables)

dim(df)             # dimensions (4 rows, 3 columns)

nrow(df)            # number of rows (observations)

ncol(df)            # number of columns (variables)

str(df)             # structure of df



summary(df)         # statistical summary 


# Indexing in data frames

# Adressed by [[]] or by name of column $
# Rows or columns adressed by []

df

df[2]              # output column 2 as data frame

df[[2]]            # output as numeric

df$size            # output as numeric

df[ , 2]           # column output as numeric

df[1, ]            # row output as data frame

df[1, 2]           # element in row 1, col 2 as numeric


# Various queries possible, boolean operators

df

df$size > 170

df[df$size > 170, ]

df[df$size > 180 & df$weight < 100, ]         # AND condition

df[df$size > 188 | df$weight < 70, ]          # OR condition

df[df$name == "Ben" | df$name == "Hanna", ]   # OR condition



# Modify data frames

df2 <- df[ , -2]                                    # delete column by index
df2

df3 <- subset(df, select = -c(weight, size))        # delete column by name
df3

df4 <- df[-3, ]                                     # delete row by index
df4

df5 <- subset(df, !name %in% c("Ben", "Hanna"))     # delete row by attribute
df5 

# Excluding columns via subset()
# Argument -select, with leading minus to specify name of column to be deleted
# ! Logical operator, negates condition
# Addition of observations possible

df$gender = c("m", "w", "m", "m")                   # add a column (variable)
df

newdata <- data.frame("name"="Lisa",                # add a row (observation)
                      "size" = 180,
                      "weight" = 70,
                      "gender" ="W"
)

df <- rbind(df, newdata)
df

# 9. Missing Values

# Sometimes observations (rows) in df are incomplete
# Correct handling needed
# Indicated by NA
# Non-possible values (division by 0) => Nan (not a number)

df
df

df[1:2, 2] <- NA          # create NAs

mean(df$size)             # mean with NAs

mean(df$size, na.rm=TRUE) # mean with ignoring NAs


# Record observations with missing values and exclude them from dataset
# Detection: is.na(), creates logical vector
# Outputs TRUE for NA values
# FALSE for element present
# Then index data frame with logical vector 

is.na(df$size)            # logical vector (TRUE for all rows with NAs)

df[is.na(df$size), ]      # index using logical vector

df[complete.cases(df), ]  # get all rows without NAs


# 10. Control Structures


# Allow better control over execution of scripts
# if, if else, else, while, switch, repeat, break, return, . . .

# if statement

# Use if/else command to perform queries
#R syntax:

x <- 3                  # define x
x <= 4                  # logical condition


if (x <= 4) {
  print("x is smaller than or equal to 4!")    
} else {
  print("x is larger than 4!")        
}

# If statement needs three inputs
# Keyword if(), condition that results in single logical output and code block in {}, executed if expression is TRUE
# If condition is TRUE code will run in {}
# If FALSE code block after else executed
# print() outputs string to console

# Vectorized (more efficient) notation:

x <- c(3, 4, 5, 6, 7)                                

ifelse(x <=4, "x is smaller than or equal to 4!", "x is larger than 4!")


# FOR loop

# Loops useful when tasks need to be repeated
# Based on interable variable of defined length
# Define any variable (i) with integer value (1)
# Increment value until second value (8) is reached
# Done via sequence operator 

for (i in 1:8) {
  print (i)
}


# Code in {} automatically executed once each time
# Meanwhile pick up expression of i , in order to print or index a vector with it

v <- c(23, 54, 12, 59, 67, 45)            # create integer vector 

length(v)                                 # check length of vector

for (i in 1:length(v)) {                  # iterate length(v) times
  print(v[i])
}


# Possible to set variable/iterator equal to elements of vector instead of integer value for indexing

v <- c("R", "is", "still", "fun")    

for (i in v) {
  print(i)
}




