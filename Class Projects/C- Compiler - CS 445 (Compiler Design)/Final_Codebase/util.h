/* author: Matthew Mills
   course: CS 445 - Compiler Design
   instructor: Dr. Robert Heckendorn
   title: util.h
   purpose: Header file for functions used by the bison file to construct the syntax tree
   date: February 2020
*/

#ifndef _UTIL_H_
#define _UTIL_H_

#include "globals.h"
#include "stdio.h"


TreeNode * newNode(NodeKind general_kind, Kind specific_kind, Type t, int line, TokenData * token);



#endif
