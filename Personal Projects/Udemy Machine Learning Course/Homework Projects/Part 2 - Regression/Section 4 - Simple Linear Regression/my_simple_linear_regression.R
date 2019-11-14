dataset = read.csv('Salary_Data.csv')


#Splitting the data into training set and test set
#install.packages('caTools')
library(caTools)

set.seed(143)
split = sample.split(dataset$Salary, SplitRatio = 0.66)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Here is the code for feature scaling

#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])

regressor = lm(formula = Salary ~ YearsExperience,
               training_set)

y_pred = predict(regressor, newdata = test_set)

library(ggplot2)

ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs. Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')
