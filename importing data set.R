install.packages("readr")
library(readr)
mba <- read.csv("E://excelr//excelr//data science//data sets//data sets_BA//mba.csv")
View((mba))



# Another way to import .csv file
library(readr)
hours_transaction <- read.csv(file.choose())
View(hours_transaction)

# Another way

getwd()
setwd("E://excelr//excelr//data science//data sets//data sets_BA")
paper <- read.csv("NewspaperData.csv")
View(paper)


