/* author: Matthew Mills
   course: CS 445 - Compiler Design
   instructor: Dr. Robert Heckendorn
   title: printTree.cpp
   purpose: Source file containing function definitions declared in printTree.h
   date: February 2020
*/

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

// this function recursively traverses the syntax tree, and prints out the data and metadate for each node. For each node, the function printTree prints the node's data and metadata, and then recursively calls itself on the node's three children and the node's sibling

void printTree(TreeNode *tree, int childnum, int siblingnum, bool calledAsChild, bool calledAsSibling, string formatStr, bool printTypes){

// if tree node passed to function is NULL, then return
    if (!tree)
	return;

// each node corresponds to a single output string called printVal, and printval is assigned a value depending on whatever the node happens to be
    string printVal = "";
    string typeStr = "";

    if (calledAsChild){ formatStr += "!   "; printVal += (formatStr + "Child: " + std::to_string(childnum) + " "); }
	
    if (calledAsSibling) printVal += (formatStr + "Sibling: " + to_string(siblingnum) + " " );


// a switch statement is used to determine the type of node, and then the correct output is added to printVal accordingly

    switch (tree->kind)
    {
	    case BreakK:

		printVal += ("Break");
		
		break;

	    case ReturnK:

		printVal += ("Return");
		
		break;

	    case ElsifK:

		printVal += ("Elsif");
		
		break;

	    case LoopK:

		printVal += ("Loop");
		
		break;

	    case LoopForeverK:

		printVal += ("LoopForever");
		
		break;

	    case WhileK:

		printVal += ("While");
		
		break;

	    case RangeK:

		printVal += ("Range");
		
		break;

	    case IfK:

		printVal += ("If");
		
		break;
	    case CompoundK:

		printVal += ("Compound");
		
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

		printVal += ("Assign: " + string(tree->token->tokenstr));
		
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

		printVal += ("Op: " + string(tree->token->tokenstr));
		
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

		printVal += ("Call: " + string(tree->token->tokenstr));
		
		break;

	    case IdK:{

		std::string scopeStr;
		if (tree->global) scopeStr = "Global";
		else if (tree->parameter) scopeStr = "Parameter";
		else if (tree->localStatic) scopeStr = "LocalStatic";
		else if (tree->local) scopeStr = "Local";
		else { scopeStr = "None"; tree->memSize = 1; }

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

		printVal += ("Id: " + string(tree->token->tokenstr) + " [mem: " + scopeStr + "  size: " + to_string(tree->memSize) + "  loc: " + to_string(tree->locNum) + "]");
		
		break;

	}


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

		printVal += ("Op: " + string(tree->token->tokenstr));
		
		break;

	    case FunK:

		printVal += ("Func " + string(tree->token->tokenstr) + " returns type ");

		switch (tree->nodetype)
    		{
		    case Int:
                        printVal += ("int [mem: Global  loc: 0]");
			
			
			break;

		    case Bool:
			printVal += ("bool [mem: Global  loc: 0]");
			
			
			break;
			
		    case Char:
			printVal += ("char [mem: Global  loc: 0]");
			
			
			break;

		    case Void:
			printVal += ("void [mem: Global  loc: 0]");
			
			
			break;
    		}


	    break;

	    case ParamK:

		printVal += ("Param " + string(tree->token->tokenstr) + " ");
		if (tree->isArray) printVal += "is array ";

		switch (tree->nodetype)
    		{
		    case Int:
                        printVal += ("of type int [mem: Parameter  size: 1  loc: " + to_string(tree->locNum) + "]");
			
			
			break;

		    case Bool:
			printVal += ("of type bool [mem: Parameter  size: 1  loc: " + to_string(tree->locNum) + "]");
			
			
			break;
			
		    case Char:
			printVal += ("of type char [mem: Parameter  size: 1  loc: " + to_string(tree->locNum) + "]");
			
			
			break;
    		}

		break;


	    case VarK:{

		printVal += ("Var " + string(tree->token->tokenstr) + " ");
		if (tree->isArray) printVal += "is array ";

		std::string scopeStr;
		if (tree->global) scopeStr = "Global";
		else if (tree->localStatic) scopeStr = "LocalStatic";
		else scopeStr = "Local";

		switch (tree->nodetype)
    		{
		    case Int:
                        printVal += ("of type int [mem: " + scopeStr + "  size: " + to_string(tree->memSize) + "  loc: " + to_string(tree->locNum) + "]");
			
			
			break;

		    case Bool:
			printVal += ("of type bool [mem: " + scopeStr + "  size: " + to_string(tree->memSize) + "  loc: " + to_string(tree->locNum) + "]");
			
			
			break;
			
		    case Char:
			printVal += ("of type char [mem: " + scopeStr + "  size: " + to_string(tree->memSize) + "  loc: " + to_string(tree->locNum) + "]");
			
			
			break;
    		}

		break;

	}
		

	    case ConstK:

		switch (tree->nodetype)
    		{
			
		    case Int:
			if (printTypes) typeStr += " [type int]";

			printVal += ("Const: " + to_string(tree->token->numValue));
			
			break;

		    case Bool:
			if (printTypes) typeStr += " [type bool]";

			printVal += ("Const: " + string(tree->token->tokenstr));
			
			break;

		    case Char:
			if (printTypes) typeStr += " [type char]";
			if (tree->isArray){

			printVal += ("Const: " + string("\"") + string(tree->token->strValue) + string("\""));
			
			}
			else{
			string subPrint = string(tree->token->strValue);
			if (tree->token->strValue [0] == '\0') subPrint = " ";

			printVal += ("Const: " + string("'") + subPrint + string("'"));
			
			}

			break;
    		}
		
		break;
    }

// printVal is displayed
    cout << printVal << endl;

// printTree called recursively on the current node's children
    printTree(tree->child[0], 0, -1, true, false, formatStr, printTypes);
    printTree(tree->child[1], 1, -1, true, false, formatStr, printTypes);
    printTree(tree->child[2], 2, -1, true, false, formatStr, printTypes);

    siblingnum++;

// printTree called recursively on the current node's sibling
    printTree(tree->sibling, 0, siblingnum, false, true, formatStr, printTypes);
}
