#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sun Oct 14 14:21:22 2018

@author: matthew
"""

# Data Preprocessing Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Salary_Data.csv')

#This code uses imputer to look for missing data and replace NaN values with their column's mean

X = dataset.iloc[:, :-1].values

y = dataset.iloc[:, 1].values



#This code splits the data into the training set and the test set

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.33, random_state = 42)

#The libraries for simple linear regression automatically handle feature scaling

from sklearn.linear_model import LinearRegression

regressor = LinearRegression()

regressor.fit(X_train, y_train)

y_pred = regressor.predict(X_test)

plt.scatter(X_test, y_test, color='red')
plt.plot(X_train, regressor.predict(X_train), color='blue')
plt.title('Salary vs. Experience (Test Set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()