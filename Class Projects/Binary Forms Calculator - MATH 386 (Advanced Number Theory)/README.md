# Binary-Form-Calculator

I created this C# program to solve commonly occurring homework problems in MATH 386 in Spring 2018 at the University of Idaho.
Math 386 is an advanced Number Theory class, and this particular project was based on the concept of binary quadratic forms.
A binary quadratic form is a two-variable expression of the form Ax^2 + Bxy + Cy^2, where A,B,C are coefficients. More information
about binary quadratic forms are given in the link below:

https://crypto.stanford.edu/pbc/notes/numbertheory/form.html

The discriminant of a binary quadratic form is given as B^2 - 4AC. Also, a binary quadratic form with only integer coefficients is
called an integral binary quadratic form. The purpose of this project was to create a program that would allow the user to enter an integer
value for a discriminant, and then output all classes of integral binary quadratic forms that have a discriminant value equal to the given value.
A class of binary quadratic forms is merely a triple of values (A,B,C) s.t. A,B, and C are the coefficients of an integral binary quadratic form.
In order to find the classes of binary forms with a given discriminant value, the C# code implements several theories presented in the text for this
class, which is called "Primes of the Form x^2 + ny^2" by Wiley. A link for it is shown below.

https://dacox.people.amherst.edu/primes.html

The code also relies on the Euclidean Algorithm to compute the Greatest Common Divisor of two given integers, more information about the Euclidean Algorithm is
given below:

http://mathworld.wolfram.com/EuclideanAlgorithm.html

The file called "BinaryFormCalculatorRuntime.jpeg" in this folder shows a screenshot of the calculator after it was run. The integer 23 was given as the value of the
discriminant D, and then the three triples in the smaller message box represent the classes of integral binary quadratic forms whose discriminant values equal 23. In other
words, for each triple in the message box (A,B,C), the integral binary quadratic form Ax^2 + Bxy + Cy^2 has the following property, that B^2 - 4AC = 23.
