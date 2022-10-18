# Common Functions used in R

# Strings
# Paste - combine character strings in R

# simple paste function 
paste('one',2,'three',4,'five') # default sep is space ' '

# paste function with sep argument
paste('X', 1:5,sep = '') # sep = to separate the terms

# paste function with collapse Argument
paste(c('one','two','three','four'), collapse = ' and ') # collapse =  to separate the results
  
# paste function in R with separator and collapse Argument
paste(c('X','Y'), 1:5, sep = '_', collapse = ' and ')

# paste(0)
paste0('one',2,'three',4,'five')

# Sort - sort numerical values or character strings
# numerical vector sort
v1 <- c(1,2,4,5,7,11)
sort(v1) # increasing is default
sort(v1, decreasing=TRUE) # sorts in descending order

# Character vector sort
v2 <- c("Cherry","BlueBerry","Apple","Pineapple")
sort(v2) # sorts in Alphabetical order which is default
sort(v2,decreasing = TRUE) # sorts in Reverse Alphabetical order

# unlist
mylist = list(c(1,4,6),"dog",3,"cat",TRUE,c(9,10,11))
mylist
class(mylist)
unlist(mylist)
class(unlist(mylist))

# Merge Lists
list1 <- list(1,2,3)
list2 <- list("Jan","Feb","Mar")
merged.list <- c(list1,list2)
merged.list

# Matrix Computations
matrix1 <- matrix(c(1, 3, 5, 7), nrow = 2)
matrix2 <- matrix(c(2, 4, 6, 8), nrow = 2)
matrix1
matrix2
# Add the matrices.
Mat.Add <- matrix1 + matrix2
Mat.Add
# Subtract the matrices
Mat.Sub <- matrix1 - matrix2
Mat.Sub
# Multiply the matrices.
Mat.Multi <- matrix1 * matrix2
Mat.Multi
# Divide the matrices
Mat.Div <- matrix1 / matrix2
Mat.Div

week = c("sunday","monday","tuesday","wednesday","thursday","friday","saturday","wednesday","tuesday","thursday","wednesday")
week
table(week)
prop.table(table(week))*100

week_ordered = factor(week, levels=c("sunday","monday","tuesday","wednesday","thursday","friday","saturday"), ordered=TRUE)
week_ordered
table(week_ordered)
prop.table(table(week_ordered))
sort(prop.table(table(week_ordered))) # increasing order by default
sort(prop.table(table(week_ordered)), decreasing = TRUE) # decreasing order

# Generating Factor Levels
gl(n, k, labels)
# n = no. of levels.
k#  = no. of replications.
# labels is a vector of labels for the resulting factor levels

v <- gl(3, 4, labels = c("India", "USA", "Russia"))
v

# Create the data frame.
emp.data <- data.frame(emp_id = c (1:5),
                       emp_name = c("john","marsh","mitchell","lara","peter"),
                       salary = c(6213,1515,4113,3729,2843),
                       joining_date = as.Date(c("2012-12-01","2014-07-23","2012-11-15","2015-05-11","2016-03-27")),
                       stringsAsFactors=FALSE )
emp.data
emp.data[1:2, ] # accessing 1st 2 cols & all rows
emp.data[ ,1:3] # accessing all rows & 1st 3 cols
emp.data[c(3,5),c(2,4)] # accessing 3,5 rows and 2,4 cols

# cbind 
# adding col without cbind
emp.data$dept <- c("IT","Operations","IT","HR","Finance") # adding the "dept" column
emp.data

# adding col using cbind
designation <- c ("Entry level","Manager","Technical specialist","Entry level","Senior Level")
emp.table<-cbind(emp.data,designation)
emp.table

emp1 <- cbind(designation, emp.data)
emp1
names(emp1)
emp1 = emp1[,c(2,3,1,4:6)]
emp1

# rbind
# Create the second data frame. 
emp.table.new <- data.frame(
  emp_id = c (6:8),
  emp_name = c("lila","raj","tera"),
  salary = c(2413,5415,6413),
  joining_date = as.Date(c("2014-03-01","2015-07-23","2016-11-15")),
  dept=c("IT","Finance","Operartions"),
  designation = c("Manager","Entry level","Senior Level"),
  stringsAsFactors=FALSE
)
emp.table.new

# Binds the two data frames
emp.table.final<- rbind(emp.table,emp.table.new)
emp.table.final

# Join (Merge) data frames (inner, outer, left, right) 
df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Oven", 3), rep("Television", 3)))
df1
df2 = data.frame(CustomerId = c(2, 4, 6), State = c(rep("California", 2), rep("Texas", 1)))
df2
# Merging happens based on the common column name in both the data sets
# Inner Join
df<-merge(x=df1,y=df2,by="CustomerId")
df
# Outer Join
df<-merge(x=df1,y=df2,by="CustomerId",all=TRUE)
df
# Left outer join
df<-merge(x=df1,y=df2,by="CustomerId",all.x=TRUE)
df
# Right outer join 
df<-merge(x=df1,y=df2,by="CustomerId",all.y=TRUE)
df
# Cross join
df<-merge(x = df1, y = df2, by = NULL)
df

# apply 
# Returns a vector or array or list of values obtained by applying a function to margins of an array or matrix.
x <- matrix(rnorm(30), nrow=5, ncol=6)
x
apply(x, 1 ,sum)
apply(x, 2 ,sum)
apply(x, 1:2, function(x) x/2)

# lapply 
# lapply function takes list, vector or Data frame  as input and returns only list as output
A <- matrix(1:9, 3,3)
A
B <- matrix(4:15, 4,3)
B
C <- matrix(8:10, 3,2)
C
MyList <- list(A,B,C)
MyList
class(MyList)
lapply(MyList, mean)

# sapply 
# sapply function takes list, vector or Data frame  as input. It is similar to lapply function but returns only vector as output
sapply(MyList, mean)

random <- c("This","is","random","vector")
random
sapply(random, nchar)

# mapply
# mapply applies FUN to the first elements of each (.) argument, the second elements, the third elements, and so on.
mapply(sum, c(1,2,3), c(4,5,6), c(7,8,9))
mapply(sum, matrix1, matrix2)

# tapply
# tapply is used when you want to apply a function to subsets of a vector and the subsets are 
# defined by some other vector, usually a factor
attach(iris)
iris
tapply(iris$Sepal.Length, Species, mean) # mean of Sepal.Length for all 3 Species 
tapply(iris$Sepal.Width, Species, median)

# rapply
# rapply function in R is nothing but recursive apply, as the name suggests it is used to apply a 
# function to all elements of a list recursively
x=list(3,list(4,5),6,list(7,list(8,9)))
x
rapply(x,function(x) x^2,class=c("numeric"))

# vapply 
# vapply function in R is similar to sapply, but has a pre-specified type of return value, 
# so it can be safer (and sometimes faster) to use
vapply(1:5, sqrt, 1i)

# cat function
cat('one',2,'three',4,'five')
cat(1:10,sep="\t")
cat(1:10,sep="\n")
cat(1:10,file="num_series.xlsx",sep="\n",append ="FALSE") # By deafult is FALSE

getwd() # to know the working directory 
setwd("E:\\Saif\\Training\\Data\\R Programmming") # to set the working directory 

set.seed(123) # reproducing same results
y <- matrix(rnorm(30), nrow=5, ncol=6)
y
apply(y, 1 ,sum)
apply(y, 2 ,sum)
apply(y, 1:2, function(x) x/2)

# R cat function with append="TRUE"
cat(1:10,file="num_series.csv",sep="\n")
cat(11:20,file="num_series.csv",sep="\n",append ="TRUE")
