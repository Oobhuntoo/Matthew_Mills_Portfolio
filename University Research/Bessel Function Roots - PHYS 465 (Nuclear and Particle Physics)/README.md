# Roots of the Bessel Function

The goal of this project was to create a python script that will compute the nth root of the Bessel function for a given
Angular Momentum Quantum number. It contains a function that will return the nth root of the Lth bessel function of the first kind,
which is a solution to the Bessel differential equation. According to the following link, the roots of these bessel equations identified by
the quantum numbers n and L are useful to calculate the probability that certain subatomic particles with quantum numbers n and L will 
be at a given energy level.

https://farside.ph.utexas.edu/teaching/qmech/Quantum/node81.html

The formula at the following link was used as the expression for the bessel equation of the first kind onto which a numerical method 
was applied to render a function that returns the desired roots of the bessel function accurate up to 6 decimal places. The method involved
iteratively plugging in equispaced points along the positive real number line into the Bessel function and using the Intermediate Value Theorem to
find when there was a change in sign of the function values and thus approximate the root.

https://keisan.casio.com/exec/system/1180573472

Below is some more general information about the Bessel function:

http://mathworld.wolfram.com/BesselFunction.html

