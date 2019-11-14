dataset = read.csv('/Users/matthew/Documents/ChalkLabs/UdemyCourse/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing/Data.csv')
#This code looks for missing data and replaces with the mean of the column
#dataset$Age = ifelse(is.na(dataset$Age), 
                     #ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     #dataset$Age)

#dataset$Salary = ifelse(is.na(dataset$Salary), 
                        #ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        #dataset$Salary)

# This code encodes the categorical data with integer values
#dataset$Country = factor(dataset$Country,
                       #  levels = c('France', 'Spain', 'Germany'),
                         #labels = c(1,2,3))

#dataset$Purchased = factor(dataset$Purchased,
                         #levels = c('No', 'Yes'),
                         #labels = c(0,1))

#Splitting the data into training set and test set
#install.packages('caTools')
library(caTools)

set.seed(143)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Here is the code for feature scaling

#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])

