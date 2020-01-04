"""
Created on Sun Dec 29 19:24:30 2019

@author: Matthew
"""
import matplotlib.pyplot as plt
import math

def tree_of_life(num):
    
    circle_list = []
    
    for i in range(0,num):
        
        circle = plt.Circle((math.cos((2*math.pi) / num * (i + 1)), math.sin((2*math.pi) / num * (i + 1))), 1, fill=False)
        circle_list.append(circle)
    
    fig, ax = plt.subplots()
    ax.axis('equal')
    ax.set_xlim([-4,4])
    ax.set_ylim([-4,4])
    for circle in circle_list:
        ax.add_artist(circle)
        
    fig.savefig('plotcircles.png')

num = -1

tree_of_life(150)
#while num != 0:
#    print("Enter an integer > 0 to see a tree of life pattern with that many circles, enter 0 to quit")
#    num = int(input())
#    tree_of_life(num)