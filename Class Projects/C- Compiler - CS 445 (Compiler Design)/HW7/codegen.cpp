#include <stdio.h>
#include <stdlib.h>
#include "scanType.h"
#include "globals.h"
#include "util.h"
#include <string>
#include <iostream>
#include "semantic.h"
#include <map>
#include <vector>
#include "codegen.h"
#include "emitcode.h"

using namespace std;



void codeGeneration(TreeNode *tree, bool isTop, std::string filename, int mainAddr, SymbolTable st, int *globalOffset){
	
    
    if (isTop){

        code = fopen(filename.c_str(), "w");
	isTop = false;
    }

    if (!tree)
	return;



    switch (tree->kind)
    {
	    case BreakK:

		emitComment((char*)"BREAK");
		emitRMAbs((char*)"LDA", 7, emitSkip(0), (char*)"breaK");
		backPatchAJumpToHere((char*)"JZR", 3, 7, (char*)"Jump around the THEN if false [backpatch]");
		
		break;

	    case ReturnK:

		emitComment((char*)" RETURN");

		emitRO((char*)"LD", 3, -1, 1, (char*)"Load return address");
		emitRO((char*)"LD", 1, 0, 1, (char*)"Adjust fp");
		emitRO((char*)"LDA", 7, 0, 3, (char*)"Return");
		
		break;

	    case ElsifK:

		emitComment((char*)"ELSIF");

		break;

	    case LoopK:{

		emitComment((char *)"LOOP");
		TreeNode *loopindex = tree->child[0];              // get pointer to Treenode for loop index variable

		// process the range
		{
		    TreeNode *rangenode;

		    rangenode = tree->child[1];
		    //codegen_expression(rangenode->child[0]);
		    emitRM((char *)"ST", AC, loopindex->locNum, FP, (char *)"save starting value in index variable");
		    //codegen_expression(rangenode->child[1]);
		    emitRM((char *)"ST", AC, loopindex->locNum-1, FP, (char *)"save ending value");
		    //codegen_expression(rangenode->child[2]);
		    emitRM((char *)"ST", AC, loopindex->locNum-2, FP, (char *)"save increment values");
		}

		int currloc = emitSkip(0);                      // return to here to do the test

		// strictly increasing increment
	//	emitRM((char *)"LD", AC, loopindex->locNum, FP, (char *)"loop index");
	//	emitRM((char *)"LD", AC1, loopindex->locNum-1, FP, (char *)"ending value");
	//      emitRO((char *)"TLT", AC, AC, AC1, (char *)"Op <");
	//	emitRM((char *)"JNZ", AC, 1, PC, (char *)"Jump to loop body");

		// increment can be + or -
		emitRM((char *)"LD", AC1, loopindex->locNum, FP, (char *)"loop index");
		emitRM((char *)"LD", AC2, loopindex->locNum-1, FP, (char *)"ending value");
		emitRM((char *)"LD", AC, loopindex->locNum-2, FP, (char *)"increment value");
		emitRO((char *)"SLT", AC, AC1, AC2, (char *)"Op <");
		emitRM((char *)"JNZ", AC, 1, PC, (char *)"Jump to loop body");


		int breakloc = emitSkip(1);            // addr of instr that jumps to end of loop
			                                  // this is also the backpatch point
		int skiploc = breakloc;                // save the old break statement return point

		// do body of loop
		//codegen_general(currnode->child[2]);         // do body of loop

		// do increment stuff
		emitComment((char *)"LOOP INC AND JMP");
		emitRM((char *)"LD", AC, loopindex->locNum, FP, (char *)"Load index");
		emitRM((char *)"LD", AC2, loopindex->locNum-2, FP, (char *)"Load increment");
		emitRO((char *)"ADD", AC, AC, AC2, (char *)"increment");
		emitRM((char *)"ST", AC, loopindex->locNum, FP, (char *)"store into index");

		emitGotoAbs(currloc, (char *)"go to beginning of loop");
		backPatchAJumpToHere(breakloc, (char *)"Jump past loop [backpatch]");   // backpatch jump to end of loop

		breakloc = skiploc;              // restore for break statement

		emitComment((char *)"END LOOP");
		break;

	}

	    case LoopForeverK:{

		emitComment((char *)"LOOP");
		TreeNode *loopindex = tree->child[0];              // get pointer to Treenode for loop index variable

		// process the range
		{
		    TreeNode *rangenode;

		    rangenode = tree->child[1];
		    //codegen_expression(rangenode->child[0]);
		    emitRM((char *)"ST", AC, loopindex->locNum, FP, (char *)"save starting value in index variable");
		    //codegen_expression(rangenode->child[1]);
		    emitRM((char *)"ST", AC, loopindex->locNum-1, FP, (char *)"save ending value");
		    //codegen_expression(rangenode->child[2]);
		    emitRM((char *)"ST", AC, loopindex->locNum-2, FP, (char *)"save increment values");
		}

		int currloc = emitSkip(0);                      // return to here to do the test

		// strictly increasing increment
	//	emitRM((char *)"LD", AC, loopindex->locNum, FP, (char *)"loop index");
	//	emitRM((char *)"LD", AC1, loopindex->locNum-1, FP, (char *)"ending value");
	//      emitRO((char *)"TLT", AC, AC, AC1, (char *)"Op <");
	//	emitRM((char *)"JNZ", AC, 1, PC, (char *)"Jump to loop body");

		// increment can be + or -
		emitRM((char *)"LD", AC1, loopindex->locNum, FP, (char *)"loop index");
		emitRM((char *)"LD", AC2, loopindex->locNum-1, FP, (char *)"ending value");
		emitRM((char *)"LD", AC, loopindex->locNum-2, FP, (char *)"increment value");
		emitRO((char *)"SLT", AC, AC1, AC2, (char *)"Op <");
		emitRM((char *)"JNZ", AC, 1, PC, (char *)"Jump to loop body");


		int breakloc = emitSkip(1);            // addr of instr that jumps to end of loop
			                                  // this is also the backpatch point
		int skiploc = breakloc;                // save the old break statement return point

		// do body of loop
		//codegen_general(currnode->child[2]);         // do body of loop

		// do increment stuff
		emitComment((char *)"LOOP INC AND JMP");
		emitRM((char *)"LD", AC, loopindex->locNum, FP, (char *)"Load index");
		emitRM((char *)"LD", AC2, loopindex->locNum-2, FP, (char *)"Load increment");
		emitRO((char *)"ADD", AC, AC, AC2, (char *)"increment");
		emitRM((char *)"ST", AC, loopindex->locNum, FP, (char *)"store into index");

		emitGotoAbs(currloc, (char *)"go to beginning of loop");
		backPatchAJumpToHere(breakloc, (char *)"Jump past loop [backpatch]");   // backpatch jump to end of loop

		breakloc = skiploc;              // restore for break statement

		emitComment((char *)"END LOOP");
		break;

	}

	    case WhileK:

		emitComment((char*)"WHILE");

		
		break;

	    case RangeK:
		// range is traversed by loopk.
		printf("ERROR(SYSTEM): we should never be trying to traverse a range node\n");
		exit(1);
		
		break;

	    case IfK:

		emitComment((char*)"IF");
		
		break;
	    case CompoundK:

		emitComment((char*)"COMPOUND");
		emitComment((char*)"Compound body");


		
		break;

	    case AssignK:{

		int globalFlag;
		if ((std::string)tree->token->tokenstr == "="){

			if (tree->child[0]->locNum == 0) globalFlag = 0;
			else globalFlag = 1;

			TreeNode *arg = tree->child[1];

			if (arg->kind == ConstK){

			if (arg->nodetype == Int){

			emitRO((char*)"LDC", 3, arg->token->numValue, 6, (char*)"Load integer constant");
			arg->codegened = true;
			}

			if (arg->nodetype == Bool){

			emitRO((char*)"LDC", 3, arg->token->numValue, 6, (char*)"Load Boolean constant");
			arg->codegened = true;
			}

			if (arg->nodetype == Char){

			emitRO((char*)"LDC", 3, (int)*arg->token->strValue, 6, (char*)"Load char constant");
			arg->codegened = true;
			}

			}

			emitRO((char*)"ST", 3, tree->locNum - 2, 1, (char*)"Store parameter");
		}

		if ((std::string)tree->token->tokenstr == "++"){

			TreeNode *LHS = tree->child[0];
			emitRO((char*)"LD", 3, LHS->locNum, 1, (char*)"load lhs variable");
			emitRO((char*)"LDA", 3, 1, 3, (char*)"increment value");
			emitRO((char*)"ST", 3, LHS->locNum, 1, (char*)"store variable");
		}
		
		if ((std::string)tree->token->tokenstr == "--"){
			TreeNode *LHS = tree->child[0];
			emitRO((char*)"LD", 3, LHS->locNum, 1, (char*)"Load variable");
			emitRO((char*)"LDA", 3, -1, 3, (char*)"decrement value");
			emitRO((char*)"ST", 3, LHS->locNum, 1, (char*)"store variable");
		}

		if ((std::string)tree->token->tokenstr == "+="){
			TreeNode *LHS = tree->child[0];
			emitRO((char*)"LD", 3, LHS->locNum, 1, (char*)((std::string)" Load variable " + (std::string)LHS->token->tokenstr).c_str());

			emitRO((char*)"LD", 4, LHS->locNum, 1, (char*)"load lhs variable runningSum");
			emitRO((char*)"ADD", 3, 4, 3, (char*)"Op +=");
			emitRO((char*)"ST", 3, LHS->locNum - 2, 0, (char*)"store variable");
		}
		if ((std::string)tree->token->tokenstr == "-="){
			TreeNode *LHS = tree->child[0];
			emitRO((char*)"LD", 3, LHS->locNum, 1, (char*)((std::string)" Load variable " + (std::string)LHS->token->tokenstr).c_str());

			emitRO((char*)"LD", 4, LHS->locNum, 1, (char*)"load lhs variable runningSum");
			emitRO((char*)"SUB", 3, 4, 3, (char*)"Op -=");
			emitRO((char*)"ST", 3, LHS->locNum - 2, 0, (char*)"store variable");
		}
		if ((std::string)tree->token->tokenstr == "*="){
			TreeNode *LHS = tree->child[0];
			emitRO((char*)"LD", 3, LHS->locNum, 1, (char*)((std::string)" Load variable " + (std::string)LHS->token->tokenstr).c_str());

			emitRO((char*)"LD", 4, LHS->locNum, 1, (char*)"load lhs variable runningSum");
			emitRO((char*)"MUL", 3, 4, 3, (char*)"Op *=");
			emitRO((char*)"ST", 3, LHS->locNum - 2, 0, (char*)"store variable");
		}
		if ((std::string)tree->token->tokenstr == "/="){
			TreeNode *LHS = tree->child[0];
			emitRO((char*)"LD", 3, LHS->locNum, 1, (char*)((std::string)" Load variable " + (std::string)LHS->token->tokenstr).c_str());

			emitRO((char*)"LD", 4, LHS->locNum, 1, (char*)"load lhs variable runningSum");
			emitRO((char*)"DIV", 3, 4, 3, (char*)"Op /=");
			emitRO((char*)"ST", 3, LHS->locNum - 2, 0, (char*)"store variable");
		}

		break;

	}

	    case OpK:{

		std::string expStr = (std::string)tree->token->tokenstr;
	

		TreeNode *LHS = tree->child[0];
		TreeNode *RHS = tree->child[1];

		if (LHS->kind == IdK){

			emitRO((char*)"LD", 3, LHS->locNum, 1, (char*)((std::string)" Load variable " + (std::string)LHS->token->tokenstr).c_str());

			emitRO((char*)"ST", 3, LHS->locNum - 2, 1, (char*)"Store left hand side");

			emitRO((char*)"LD", 4, LHS->locNum - 2, 1, (char*)"Load into ac1");

		}

		if (RHS->kind == IdK){

			emitRO((char*)"LD", 3, RHS->locNum, 1, (char*)((std::string)" Load variable " + (std::string)LHS->token->tokenstr).c_str());

			emitRO((char*)"ST", 3, RHS->locNum - 2, 1, (char*)"Store right hand side");

			emitRO((char*)"LD", 5, RHS->locNum - 2, 1, (char*)"Load into ac2");

		}

		if (expStr == "<"){
	
			emitRO((char*)"TLT", 3, 4, 3, (char*)"Op <");
		}

		if (expStr == "<="){
	
			emitRO((char*)"TLE", 3, 4, 3, (char*)"Op <=");
		}

		if (expStr == "=="){
	
			emitRO((char*)"TEQ", 3, 4, 3, (char*)"Op ==");
		}

		if (expStr == "!="){
	
			emitRO((char*)"TNE", 3, 4, 3, (char*)"Op !=");
		}

		if (expStr == "<="){
	
			emitRO((char*)"TLE", 3, 4, 3, (char*)"Op <=");
		}

		if (expStr == ">="){
	
			emitRO((char*)"TGE", 3, 4, 3, (char*)"Op >=");
		}

		if (expStr == ">"){
	
			emitRO((char*)"TGT", 3, 4, 3, (char*)"Op >");
		}
		if (expStr == "+"){
	
			emitRO((char*)"ADD", 3, 4, 3, (char*)"Op +");
		}
		if (expStr == "-"){
	
			emitRO((char*)"SUB", 3, 4, 3, (char*)"Op -");
		}
		if (expStr == "*"){
	
			emitRO((char*)"MUL", 3, 4, 3, (char*)"Op *");
		}
		if (expStr == "/"){
	
			emitRO((char*)"DIV", 3, 4, 3, (char*)"Op >");
		}
		if (expStr == "and"){
	
			emitRO((char*)"AND", 3, 4, 3, (char*)"Op and");
		}
		if (expStr == "or"){
	
			emitRO((char*)"OR", 3, 4, 3, (char*)"Op or");
		}

	
		
		break;

	}

	    case CallK:{

		emitComment((char*)((std::string)" CALL " + (std::string)tree->token->tokenstr).c_str());
		emitRO((char*)"ST", 1, tree->locNum, 1, (char*)"Store fp in ghost frame for output");
		int paramCount = 1;
		TreeNode *arg = tree->child[0];

		int globalFlag;

		while (arg != NULL){

			emitComment((char*)((std::string)" PARAM " + std::to_string(paramCount)).c_str());

			if (arg->kind == ConstK){

				if (arg->nodetype == Int){

				emitRO((char*)"LDC", 3, arg->token->numValue, 6, (char*)"Load integer constant");
				arg->codegened = true;
				}

				if (arg->nodetype == Bool){

				emitRO((char*)"LDC", 3, arg->token->numValue, 6, (char*)"Load Boolean constant");
				arg->codegened = true;
				}

				if (arg->nodetype == Char){

				emitRO((char*)"LDC", 3, (int)*arg->token->strValue, 6, (char*)"Load char constant");
				arg->codegened = true;
				}

			}

			else{

				if (arg->locNum == 0) globalFlag = 0;
				else globalFlag = 1;

				emitRO((char*)"LD", 3, arg->locNum, globalFlag, (char*)((std::string)" Load variable " + (std::string)arg->token->tokenstr).c_str());

			}

			emitRO((char*)"ST", 3, tree->locNum - 2 - (paramCount - 1), 1, (char*)"Store parameter");

			paramCount += 1;
			arg = arg->sibling;		

		}

		emitComment((char*)((std::string)" END PARAM " + (std::string)tree->token->tokenstr).c_str());

		emitRO((char*)"LDA", 1, tree->locNum, 1, (char*)"Load address of new frame");
		emitRO((char*)"LDA", 3, 1, 7, (char*)"Return address in ac");

		TreeNode *funNode = (TreeNode*)st.lookup((std::string)tree->token->tokenstr);
		emitRMAbs((char*)"LDA", 7, funNode->funLoc - 1, (char*)((std::string)" CALL " + (std::string)tree->token->tokenstr).c_str());
		emitRO((char*)"LDA", 3, 0, 2, (char*)"Save the result in ac");

		emitComment((char*)((std::string)" END CALL " + (std::string)tree->token->tokenstr).c_str());
	
		
		break;

	}

	    case IdK:

	
		
		break;


	    case UnaryK:{

		std::string expStr = (std::string)tree->token->tokenstr;
	

		TreeNode *RHS = tree->child[0];
		if (expStr == "-"){
			emitRO((char*)"LDC", 4, 0, 6, (char*)"Load 0");
			emitRO((char*)"SUB", 3, 4, 3, (char*)"Op unary -");
		}
		if (expStr == "?"){
			emitRO((char*)"LDC", 4, 0, 6, (char*)"Load 0");
			emitRO((char*)"RND", 3, 4, 3, (char*)"Op unary ?");
		}
		if (expStr == "not"){
			emitRO((char*)"LDC", 4, 0, 6, (char*)"Load 0");
			emitRO((char*)"NOT", 3, 4, 3, (char*)"Op unary not");
		}

		
		break;
	}

	    case FunK:{

		emitComment((char*)"** ** ** ** ** ** ** ** ** ** ** **");
		emitComment((char*)((std::string)" FUNCTION " + (std::string)tree->token->tokenstr).c_str());
		emitRO((char*)"ST", 3, -1, 1, (char*)"Store return address");

		if ((std::string)tree->token->tokenstr == "main") mainAddr = emitSkip(0);

		tree->funLoc = emitSkip(0);


	    break;

	}

	    case ParamK:

	

		break;


	    case VarK:

		

		break;

	
		

	    case ConstK:

		if (tree->nodetype == Int)

			if (!tree->codegened) emitRO((char*)"LDC", 3, tree->token->numValue, 6, (char*)"Load integer constant");


		if (tree->nodetype == Bool)

			if (!tree->codegened) emitRO((char*)"LDC", 3, tree->token->numValue, 6, (char*)"Load Boolean constant");

		if (tree->nodetype == Char)

			if (!tree->codegened) emitRO((char*)"LDC", 3, (int)*tree->token->strValue, 6, (char*)"Load char constant");
		
		
		break;

	}
    


    codeGeneration(tree->child[0], isTop, filename, mainAddr, st, globalOffset);

    if (tree->kind == WhileK)
	emitRO((char*)"JNZ", 3, 1, 7, (char*)"Jump to while part");

    if (tree->kind == IfK or tree->kind == ElsifK)
		emitComment((char*)"THEN");

    codeGeneration(tree->child[1], isTop, filename, mainAddr, st, globalOffset);
    codeGeneration(tree->child[2], isTop, filename, mainAddr, st, globalOffset);


    switch (tree->kind)
    {
	    case FunK:{

		if ((std::string)tree->token->tokenstr == "input")
			emitRO((char*)"IN", 2, 2, 2, (char*)"Grab int input");

		else if ((std::string)tree->token->tokenstr == "inputb")
			emitRO((char*)"INB", 2, 2, 2, (char*)"Grab bool input");

		else if ((std::string)tree->token->tokenstr == "inputc")
			emitRO((char*)"INC", 2, 2, 2, (char*)"Grab char input");

		else if ((std::string)tree->token->tokenstr == "output"){
			emitRO((char*)"LD", 3, -2, 1, (char*)"Load parameter");
			emitRO((char*)"OUT", 3, 3, 3, (char*)"Output integer");
			emitRO((char*)"LDC", 2, 0, 6, (char*)"Set return to 0");
		}

		else if ((std::string)tree->token->tokenstr == "outputb"){
			emitRO((char*)"LD", 3, -2, 1, (char*)"Load parameter");
			emitRO((char*)"OUTB", 3, 3, 3, (char*)"Output bool");
			emitRO((char*)"LDC", 2, 0, 6, (char*)"Set return to 0");
		}

		else if ((std::string)tree->token->tokenstr == "outputc"){
			emitRO((char*)"LD", 3, -2, 1, (char*)"Load parameter");
			emitRO((char*)"OUTC", 3, 3, 3, (char*)"Output char");
			emitRO((char*)"LDC", 2, 0, 6, (char*)"Set return to 0");
		}

		else if ((std::string)tree->token->tokenstr == "outnl"){
			emitRO((char*)"OUTNL", 3, 3, 3, (char*)"Output a newline");
		}

		else{
			emitRO((char*)"LDC", 2, 0, 6, (char*)"Set return value to 0");
		}

		emitRO((char*)"LD", 3, -1, 1, (char*)"Load return address");
		emitRO((char*)"LD", 1, 0, 1, (char*)"Adjust fp");
		emitRO((char*)"LDA", 7, 0, 3, (char*)"Return");
		emitComment((char*)((std::string)" END FUNCTION " + (std::string)tree->token->tokenstr).c_str());
		emitComment((char*)"");

		if ((std::string)tree->token->tokenstr == "main"){

			backPatchAJumpToHere(0, (char*)"Jump to init [backpatch]");
			emitComment((char*)"INIT");
			emitRO((char*)"LD", 0, 0, 0, (char*)"Set the global pointer");
			emitRO((char*)"LDA", 1, *globalOffset, 0, (char*)"set first frame at end of globals");
			emitRO((char*)"ST", 1, 0, 1, (char*)"store old fp (point to self)");
			emitComment((char*)"INIT GLOBALS AND STATICS");
			emitComment((char*)"END INIT GLOBALS AND STATICS");
			emitRO((char*)"LDA", 3, 1, 7, (char*)"Return address in ac");
			emitRMAbs((char*)"LDA", 7, mainAddr - 1, (char*)"Jump to main");
			emitRO((char*)"HALT", 0, 0, 0, (char*)"DONE!");
			emitComment((char*)"END INIT"); 

		}
		
		break;

	}

	    case CompoundK:{

		emitComment((char*)"END COMPOUND");

		break;
	}

	    case WhileK:{

		emitComment((char*)"END WHILE");

		break;
	}

	    case IfK:{

		emitComment((char*)"END IF");

		break;
	}

	    case ElsifK:{

		emitComment((char*)"END ELSIF");

		break;
	}
	    case VarK:{

		emitRO((char*)"ST", 3, tree->locNum, 1, (char*)"store variable");

		break;
	}


    }

    codeGeneration(tree->sibling, isTop, filename, mainAddr, st, globalOffset);

}
