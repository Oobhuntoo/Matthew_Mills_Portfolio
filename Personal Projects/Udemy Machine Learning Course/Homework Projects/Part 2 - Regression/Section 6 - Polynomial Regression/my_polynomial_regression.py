#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 15 19:34:23 2018

@author: matthew
"""

# Data Preprocessing Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Splitting the dataset into the Training set and Test set
'''from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)'''

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

# Linear Regression Model

from sklearn.linear_model import LinearRegression

lin_reg = LinearRegression()

lin_reg.fit(X, y)

# Polynomial Regression Model

from sklearn.preprocessing import PolynomialFeatures

poly_reg = PolynomialFeatures(degree = 2) # This makes a matrix of all linear combinations of the powers of x up to degree n

X_poly = poly_reg.fit_transform(X)

lin_reg_2 = LinearRegression()

lin_reg_2.fit(X_poly, y) #even though this is a polynomial regression model, it is fitted by a Linear REgression object, since there is no conceptual difference between linear and polynomial models since they are both linear combinations

# Visualization step

plt.scatter(X, y, color = 'red')
plt.plot(X, lin_reg.predict(X), color = 'blue')
plt.plot(X, lin_reg_2.predict(poly_reg.fit_transform(X)), color = 'green')
plt.show()

# This prints the expected salary of someone at level 6.5 in the company. Notice that any value can be inputtd into the regression predictor instead of the matrix of all values
print lin_reg_2.predict(poly_reg.fit_transform(6.5))


