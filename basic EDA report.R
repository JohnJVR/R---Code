install.packages("readr")
library(readr)
mba <- read.csv("E://excelr//excelr//data science//data sets//data sets_BA//mba.csv")
View((mba))
mean(mba$datasrno)
mean(mba$workex)
mean(mba$gmat)
median(mba$datasrno)
median(mba$workex)
median(mba$gmat)
var(datasrno)
var(workex)
var(gmat)
# Standard Deviation
sd(datasrno)
sd(workex)
sd(gmat)
# Range
range(datasrno)
range(workex)
range(gmat)

summary(mba)

install.packages("moments")
library(moments)
skewness(datasrno)
skewness(workex)
skewness(gmat)

kurtosis(datasrno)
kurtosis(workex)
kurtosis(gmat)

# Visual representation
hist(datasrno)
hist(workex)
hist(gmat)

barplot(datasrno)
barplot(workex)
barplot(gmat)

# plot (x,y)
plot(gmat,datasrno)
plot(gmat,workex)
plot(workex,datasrno)

# To find realtionship between two variable
# plot(x,y)
cars <- read.csv("E://excelr//excelr//data science//data sets//data sets_BA//cars.csv")
View(cars)
attach(cars)
colnames(cars)
summary(cars)
boxplot(cars)
# Checking relationship between HP (Horse Power) and SP (Speed)
plot(HP,SP)
