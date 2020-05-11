
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
