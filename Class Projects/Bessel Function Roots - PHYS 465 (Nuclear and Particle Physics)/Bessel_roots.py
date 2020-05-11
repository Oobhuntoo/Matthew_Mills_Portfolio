# -*- coding: utf-8 -*-
"""
Created on Fri Jan  3 19:35:03 2020

@author: Matthew
"""

import math
from mpmath import nsum, inf
import numpy as np

def bessel_roots(n, L):
    
    # farside.ph.utexas.edu/teaching/qmech/Quantum/node81.html
    
    base_partition = np.arange(0, 30, 0.01)
    root_neighborhoods = []
    
    # This loop finds the approximate neighborhood of the root up to 2 decimal places
    for i in range(1, len(base_partition)):
    
        # following traditional notation in real analysis, the endpoints of the interval are called a and b
        b = bessel_function(L, base_partition[i])
        a = bessel_function(L, base_partition[i - 1])
        
        # Based on the intermediate value theorem, the root to the bessel function lies between these two points called a and b
        if (a < 0 and b > 0) or (a > 0 and b < 0):
            
            root_range = [base_partition[i], base_partition[i - 1]]
            root_neighborhoods.append(root_range)
            
            if len(root_neighborhoods) == (n + 1):
                break

    chosen_root_range = root_neighborhoods[n] 
    
    top_partition = np.arange(chosen_root_range[1], chosen_root_range[0], 0.000001)

    # once the approximate range containing the root is found, a similar process is repeated to find a more precise range accurate up to 6 decimal places
    for i in range(1, len(top_partition)):

        b = bessel_function(L, top_partition[i])
        a = bessel_function(L, top_partition[i - 1])
    
        if (a < 0 and b > 0) or (a > 0 and b < 0):
    
            final_root_range = [top_partition[i], top_partition[i - 1]]
            break
         
    # The smaller endpoint of the interval containing the root is taken to be the approximation of the root. Thus, the returned value is accurate up to 6 decimal places             
    zero = final_root_range[0] 
            
    return zero
    
    
def bessel_function(L, x):
    
    # this expression is the python implementation of the expression for the bessel function of the first kind from the following link:
    # https://keisan.casio.com/exec/system/1180573472
    
    val = nsum(lambda k: ((-1) ** k) / (math.factorial(k) * math.gamma(L + k + 1)) * ((x / 2) ** (L + 2 * k)), [0, inf])
    
    return val



root = bessel_roots(0,0)
print(root)
