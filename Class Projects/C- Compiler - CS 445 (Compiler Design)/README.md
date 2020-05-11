# C- Compiler

This codebase is the culmination of a semester long project that involved building a compiler for an abbreviated version of C called C-.
I took this class in Spring semester of 2020 at the University of Idaho with Dr. Robert Heckendorn. The premise of the class is that
we had to use flex and bison to develop a scanner and parser for the C- language's grammar, and then write additional code that performed
semantic analysis and code generation. Once code generation was completed, the resulting assembly files were passed into the Tiny Machine,
which is a basic hardware emulator - to run the resulting machine code. The C- grammar and Tiny Machine (TM) description are included in this folder.
The final completed code base is stored in the folder called Final_Codebase, and previous versions of the codebase along with their corresponding
test and data files are stored in folders named for their respective homework assignments.

Highlights of the class included solving the dangling Else if problem using Extended BNF for HW2. Also, creating modular semantic checking
functions for HW3 and solving the algorithm to generate memory location data for static variables in HW6 were challenging too. Overall, I did
well in the class and learned a lot.