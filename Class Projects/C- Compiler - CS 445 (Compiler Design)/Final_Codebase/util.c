/* author: Matthew Mills
   course: CS 445 - Compiler Design
   instructor: Dr. Robert Heckendorn
   title: util.c
   purpose: Source file containing function definitions declared in util.h
   date: February 2020
*/

#include "util.h"

// When new tree node is created, its member variables are defined to default values
TreeNode * newNode( NodeKind general_kind, Kind specific_kind, Type t, int line, TokenData * token ) {
	TreeNode * treeItem = (TreeNode *) malloc(sizeof(TreeNode));;
	treeItem->nodetype = t;

	treeItem->lineno = line;

	treeItem->isUsed = false;
	treeItem->isInitialized = false;
	treeItem->hasIssued = false;

	treeItem->isIndex = false;

	treeItem->nodekind = general_kind;
	treeItem->kind = specific_kind;



	if(token != NULL) {
		treeItem->token = token;
	}

	return treeItem;
}
