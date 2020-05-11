/* author: Matthew Mills
   course: CS 445 - Compiler Design
   instructor: Dr. Robert Heckendorn
   title: codegen.h
   purpose: Header file containing definition of functions used in code generation
   date: May 2020
*/

#ifndef _CODEGEN_H_
#define _CODEGEN_H_

#include <stdio.h>
#include <stdlib.h>
#include "scanType.h"
#include "globals.h"
#include "util.h"
#include "semantic.h"
#include <string>
#include <iostream>
#include <map>

using namespace std;

// this is the pointer to the file that contains the assembly code
extern FILE* code;

void codeGeneration(TreeNode *tree, bool isTop, std::string filename, int mainAddr, SymbolTable st, int *globalOffset);

#endif
