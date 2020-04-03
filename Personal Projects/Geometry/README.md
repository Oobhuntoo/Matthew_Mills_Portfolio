# Geometry

This project is a Python program that automatically graphs various patterns selected to imitate a "tree of life"
type of pattern using python math and matplotlib. In "tree_of_life.py", there is a function that takes as its input an integer n, and then outputs an image depicting
n-many circles intersecting eachother at even intervals around the unit circle. The origin of each circle will be 2pi/n radians away from the origin of the next circle.
The line of code that computes the graph of each circle is shown below, where i is the counter variable ranging from 1 to n:

circle = plt.Circle((math.cos((2*math.pi) / num * (i + 1)), math.sin((2*math.pi) / num * (i + 1))), 1, fill=False)

The results of running the program for a value n are titled as "n-circles.png" in the same folder. Notice that as the number of circles increase,
 the pattern of interlocking circle intersections becomes more and more complex, almost depicting a fractal pattern. Below is a link talking about some of the geometric significance of this area of study, which has been dubbed "sacred geomtry" by ancient cultures:

www.ancient-wisdom.com/sacredgeometry.htm#flower

https://rationalwiki.org/wiki/Sacred_geometry



