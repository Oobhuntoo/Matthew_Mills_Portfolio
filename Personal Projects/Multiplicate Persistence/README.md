# Multiplicative Persistence

This program takes as its input a large integer, and outputs that integer's multiplicative persistence.
The definition of multiplicative persistence is given in the following resource:

http://mathworld.wolfram.com/MultiplicativePersistence.html

The C++ program relies on a recursive implementation to calculate a given integer's multiplicative persistence.
The highlight of the program is the following line:

int n_i = floor((n - int(floor(n / pow(10, ith))) * int(pow(10, ith))) / int(pow(10, ith - 1)));

This is the C++ syntax for the formula of the ith digit of an integer n. I figured out this formula by myself to
provide a way to calculate the ith digit of integer n relying on just the value of integer, rather than having to convert
the integer into a string and using string indexing to select an individual digit, and then converting it back to an integer
to take the product.

While this method of taking the product of an integer's digits is more conceptually difficult than using a string approach,
it was moreso an exercise in number theory, as well as a proof of concept for a method of taking the product of digits that
does not rely on multiple conversions of datatypes. In other words, this implementation is relies purely on mathematical principles,
rather than a computational sleight of hand.
