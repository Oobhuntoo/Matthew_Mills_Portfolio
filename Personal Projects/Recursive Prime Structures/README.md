# Display Prime Summation Forms

There have been various attempts to define a formula for the prime numbers via recurrence relation. Below are several attempts and proposed forumlas:

https://arxiv.org/abs/0711.3940

https://www.jstor.org/stable/27642221?seq=1#page_scan_tab_contents

Expressing prime numbers as a recurrence relation means finding a formulaic way to express each prime number as an expression defined by one or more previous prime numbers.
Achieving this is easier said than done, given that there are myriads of ways to express a given prime number dependent on previous primes.
For instance, the nth prime could be written as a function of the (n-1)th and (n-2)th prime. Or it could be written as a function of the (n-1)th and (n-2)th
and (n-3)th primes. These functions may be purely the addition of primes or they may apply logarithmic, polynomial, and modular forms to these previous prime values.

This program "display_prime_summation.py" was created to provide a dataset in a process that emulates the search for a primal recurrence relation.
The process involves writing each prime as a sum of previous primes and then checking to see if a pattern holds for successive prime numbers.
The algorithm involved is intuitively recursive, and generates the tree of sums of previous primes for the first 20 prime numbers.
This process current takes approximately 2 minutes to finish on a Windows 10 Intel Core i5 machine, so a long term goal is to launch the process for the first 100 primes
on a compute optimized AWS EC2 instance. The output for the first 20 primes are given in the files in this folder. 
prime_file_20.txt lists the equations using the values of the actual primes, whereas prime_labels_file_20.txt lists the equations using labels for each prime number
such as "p1" for 1, "p2" for 2, "p3" for 3, "p4" for 5, "p5" for 7, etc. It must also be stated that in this process, 1 is taken to be a prime number, even though
this is unconvential according to the classical definition of prime numbers. While unconvential, this stipulation is not logically inconsistent, given that the definition
of a prime number is "any integer only divisible by 1 and itself", and the integer 1 happens to be divisible by 1 and itself. Thus, this process is more precisely defined to be
expressing each prime as a sum of 1 and previous primes.