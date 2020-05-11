/* author: Matthew Mills
   course: CS 445 - Compiler Design
   instructor: Dr. Robert Heckendorn
   title: printTree.h
   purpose: Header file for functions used by the bison file to print the syntax tree if the -p or -P flags were passed in as a command line argument
   date: February 2020
*/

#ifndef _PRINTTREE_H_
#define _PRINTTREE_H_

#include <stdio.h>
#include <stdlib.h>
#include "scanType.h"
#include "globals.h"
#include "util.h"
#include <string>
#include <iostream>

using namespace std;

void printTree(TreeNode *tree, int childnum, int siblingnum, bool calledAsChild, bool calledAsSibling, string formatStr, bool printTypes);

#endif
