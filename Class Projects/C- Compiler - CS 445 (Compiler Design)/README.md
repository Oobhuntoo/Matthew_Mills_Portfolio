# C- Compiler

This codebase is the culmination of a semester long project that involved building a compiler for an abbreviated version of C called C-.
I took this class in Spring semester of 2020 at the University of Idaho with Dr. Robert Heckendorn. The premise of the class is that
we had to use flex and bison to develop a scanner and parser for the C- language's grammar, and then write additional code that performed
semantic analysis and code generation. Once code generation was completed, the resulting assembly files were passed into the Tiny Machine,
which is a basic hardware emulator - to run the resulting machine code. The C- grammar and Tiny Machine (TM) description are included in this folder.