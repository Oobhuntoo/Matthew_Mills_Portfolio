#include <stdio.h>
#include <stdlib.h>
#include "scanType.h"
#include "globals.h"
#include "util.h"
#include <string>
#include <iostream>
#include "printTree.h"
#include <vector>

using namespace std;


void printTree(TreeNode *tree, int childnum, int siblingnum, bool calledAsChild, bool calledAsSibling, string formatStr, bool printTypes){

    if (!tree)
	return;


    string printVal = "";
    string typeStr = "";

    if (calledAsChild){ formatStr += "!   "; printVal += (formatStr + "Child: " + std::to_string(childnum) + " "); }
	
    if (calledAsSibling) printVal += (formatStr + "Sibling: " + to_string(siblingnum) + " " );




    switch (tree->kind)
    {
	    case BreakK:

		printVal += ("Break [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case ReturnK:

		printVal += ("Return [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case ElsifK:

		printVal += ("Elsif [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case LoopK:

		printVal += ("Loop [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case LoopForeverK:

		printVal += ("LoopForever [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case WhileK:

		printVal += ("While [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case RangeK:

		printVal += ("Range [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case IfK:

		printVal += ("If [line: " + to_string(tree->token->linenum) + "]");
		
		break;
	    case CompoundK:

		printVal += ("Compound [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case AssignK:

		if (printTypes){
			switch(tree->nodetype){
			  case Int:
				typeStr += " [type int]";
				break;
			  case Char:
				typeStr += " [type char]";
				break;
			  case Bool:
				typeStr += " [type bool]";
				break;
			  case Void:
				typeStr += " [type void]";
				break;
			  case Undef:
				typeStr += " [undefined type]";
			}
		}

		printVal += ("Assign: " + string(tree->token->tokenstr) + typeStr + " [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case OpK:

		if (printTypes){
			switch(tree->nodetype){
			  case Int:
				typeStr += " [type int]";
				break;
			  case Char:
				typeStr += " [type char]";
				break;
			  case Bool:
				typeStr += " [type bool]";
				break;
			  case Void:
				typeStr += " [type void]";
				break;
			  case Undef:
				typeStr += " [undefined type]";

			}
		}

		printVal += ("Op: " + string(tree->token->tokenstr) + typeStr + " [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case CallK:

		if (printTypes){
			switch(tree->nodetype){
			  case Int:
				typeStr += " [type int]";
				break;
			  case Char:
				typeStr += " [type char]";
				break;
			  case Bool:
				typeStr += " [type bool]";
				break;
			  case Void:
				typeStr += " [type void]";
				break;
			}
		}

		printVal += ("Call: " + string(tree->token->tokenstr) + typeStr + " [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case IdK:

		if (printTypes){
			switch(tree->nodetype){
			  case Int:
				typeStr += " [type int]";
				break;
			  case Char:
				typeStr += " [type char]";
				break;
			  case Bool:
				typeStr += " [type bool]";
				break;
			  case Void:
				typeStr += " [type void]";
				break;
			}
		}

		printVal += ("Id: " + string(tree->token->tokenstr) + typeStr + " [line: " + to_string(tree->token->linenum) + "]");
		
		break;


	    case UnaryK:

		if (printTypes){
			switch(tree->nodetype){
			  case Int:
				typeStr += " [type int]";
				break;
			  case Char:
				typeStr += " [type char]";
				break;
			  case Bool:
				typeStr += " [type bool]";
				break;
			}
		}

		printVal += ("Op: " + string(tree->token->tokenstr) + typeStr + " [line: " + to_string(tree->token->linenum) + "]");
		
		break;

	    case FunK:

		printVal += ("Func " + string(tree->token->tokenstr) + " returns type ");

		switch (tree->nodetype)
    		{
		    case Int:
                        printVal += ("int [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;

		    case Bool:
			printVal += ("bool [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;
			
		    case Char:
			printVal += ("char [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;

		    case Void:
			printVal += ("void [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;
    		}


	    break;

	    case ParamK:

		printVal += ("Param " + string(tree->token->tokenstr) + " ");
		if (tree->isArray) printVal += "is array ";

		switch (tree->nodetype)
    		{
		    case Int:
                        printVal += ("of type int [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;

		    case Bool:
			printVal += ("of type bool [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;
			
		    case Char:
			printVal += ("of type char [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;
    		}

		break;


	    case VarK:

		printVal += ("Var " + string(tree->token->tokenstr) + " ");
		if (tree->isArray) printVal += "is array ";

		switch (tree->nodetype)
    		{
		    case Int:
                        printVal += ("of type int [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;

		    case Bool:
			printVal += ("of type bool [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;
			
		    case Char:
			printVal += ("of type char [line: " + to_string(tree->token->linenum) + "]");
			
			
			break;
    		}

		break;
		

	    case ConstK:

		switch (tree->nodetype)
    		{
			
		    case Int:
			if (printTypes) typeStr += " [type int]";
			printVal += ("Const: " + to_string(tree->token->numValue) + typeStr + " [line: " + to_string(tree->token->linenum) + "]");
			
			break;

		    case Bool:
			if (printTypes) typeStr += " [type bool]";
			printVal += ("Const: " + string(tree->token->tokenstr) + typeStr + " [line: " + to_string(tree->token->linenum) + "]");
			
			break;

		    case Char:
			if (printTypes) typeStr += " [type char]";
			if (tree->isArray){
			printVal += ("Const: " + string("\"") + string(tree->token->strValue) + string("\"") + typeStr + " [line: " + to_string(tree->token->linenum) + "]");
			
			}
			else{
			string subPrint = string(tree->token->strValue);
			if (tree->token->strValue [0] == '\0') subPrint = " ";
			printVal += ("Const: " + string("'") + subPrint + string("'") + typeStr + " [line: " + to_string(tree->token->linenum) + "]");
			
			}

			break;
    		}
		
		break;
    }

    cout << printVal << endl;

    printTree(tree->child[0], 0, -1, true, false, formatStr, printTypes);
    printTree(tree->child[1], 1, -1, true, false, formatStr, printTypes);
    printTree(tree->child[2], 2, -1, true, false, formatStr, printTypes);

    siblingnum++;
    printTree(tree->sibling, 0, siblingnum, false, true, formatStr, printTypes);
}
