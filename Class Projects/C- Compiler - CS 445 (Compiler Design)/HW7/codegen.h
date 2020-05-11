
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

extern FILE* code;

void codeGeneration(TreeNode *tree, bool isTop, std::string filename, int mainAddr, SymbolTable st, int *globalOffset);

#endif
