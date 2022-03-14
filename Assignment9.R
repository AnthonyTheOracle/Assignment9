BankWages <- read.table("C:\\USF\\SPRING2022\\R-PROGRAMMING\\Assignment9a\\data\\BankWages.csv", header = TRUE, sep=",")
df <- data.frame(BankWages)

##create buckets/bins for range of years in education 
BankWages$bins <- cut(BankWages$education, 3, labels = c("0-8","9-15","16-21")) 
xtabs(~ bins + job, data = BankWages)

##group bucket/bins into levels
educationLevel <- factor(BankWages$bins)

## create the group levels
tab <- xtabs(~ educationLevel + job, data = BankWages)

##plot the basic R graph
plot(job ~ educationLevel, data = BankWages, off = 0,xlab = "Years of Education",ylab="Job Type")

x<-BankWages$bins
y<-BankWages$job
plot(x,y, xlab="Years of Education", ylab="Job Type",main = "Wages of Employee of US Bank using Basic R graphic" )

## lettice R graph.  An improvement over basic R graph
library(lattice)
x <- BankWages$bins
y <- BankWages$education
z  <- BankWages$education
histogram(BankWages$bins, main = "Wages of Employee of US Bank using lattice package", xlab = "Years of Education", ylab="Percent Total")

## using ggplot2
library(ggplot2)
library(dplyr)
library(hrbrthemes)

data1 <-data.frame(BankWages)

ggplot(data1, aes(x=job, y=education)) + 
  geom_boxplot(color="red", fill="orange", alpha=0.2)