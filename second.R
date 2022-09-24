library(ggplot2)
ggplot2::ggplot()

#caluclate with R

19+23
34-22
27/9

#variables

x<-8+7
y<-4*2
x
y
x+y

my.varialbe <- x +y #convention to assign points to variables for clarity reasons

my.varialbe

#Data Type
chr <- "deep"
class(chr)
chr <- as.character(3.14444)
class(chr)

#factor
garden <- factor(c("Deep","Asmani","Vipul","Asmani","Deep","Vipul","Vipul","Deep","Asmani"))
garden
str(garden)

flood.level <- factor(c("low","high","medium","high","low","medium"),levels=c("low","medium","high"),ordered = TRUE)
min(flood.level)

df <- data.frame(
  "Name" = c("Deep","Yash","Avesh"),
  "Size" = c(34,30,38),
  "Weight" = c(78,68,90)
)
df
 

setwd("S:/ML/Project")
data=read.csv("listings.csv",header=T)
data
head(data)
summary(data)

#install.packages("readxl")
library(readxl)
data2 <- read.csv("listings.csv")
head(data2)
summary(data2)
