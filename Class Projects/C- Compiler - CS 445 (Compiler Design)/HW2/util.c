#include "util.h"



TreeNode * newNode( NodeKind general_kind, Kind specific_kind, Type t, int line, TokenData * token ) {
	TreeNode * treeItem = (TreeNode *) malloc(sizeof(TreeNode));;
	treeItem->nodetype = t;

	treeItem->lineno = line;

	treeItem->nodekind = general_kind;
	treeItem->kind = specific_kind;



	if(token != NULL) {
		treeItem->token = token;
	}

	return treeItem;
}
