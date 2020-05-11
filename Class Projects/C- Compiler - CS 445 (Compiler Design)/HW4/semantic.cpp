#include "semantic.h"

// // // // // // // // // // // // // // // // // // // //
//
// Some sample void * printing routines.   User shoud supply their own.
//

void scopeAndType(TreeNode *syntaxTree, int *numErrors, int *numWarnings, SymbolTable st, std::vector<std::string> *symbolNames, std::vector<std::string> *symbolStack, int inLoop, TreeNode *currentFunction, bool *hasReturn){

std::map<Type, std::string> typeList;
typeList[Char] = "char";
typeList[Int] = "int";
typeList[Bool] = "bool";
typeList[Void] = "void";
typeList[Undef] = "undefined";

    if (!syntaxTree)
	return;

	//printf("Line: %d\n", syntaxTree->lineno);

    switch (syntaxTree->kind)
    {
	    case BreakK:{

		if (inLoop == 0){

			printf("ERROR(%d): Cannot have a break statement outside of loop.\n", syntaxTree->lineno);
			++*numErrors;

		}
		
		
		break;

	}

	    case ReturnK:{

		*hasReturn = true;

		TreeNode *childNode = syntaxTree->child[0];
		int lineno = syntaxTree->lineno;

		if (childNode != NULL){

			bool CfunK = false;

			TreeNode *Cnode = checkID(childNode, st, numWarnings);

			issueWarning(Cnode, numWarnings, childNode->lineno);

			if (childNode->kind == IdK and Cnode == NULL) break;

			if (Cnode != NULL) CfunK = checkFunK(Cnode, numErrors, childNode->lineno);
			else Cnode = checkArray(childNode, st, numErrors, typeList, numWarnings);

			if (Cnode == NULL) Cnode = childNode;


			if (Cnode->isArray == true){

			printf("ERROR(%d): Cannot return an array.\n", lineno);
			++*numErrors;
			break;
			}

			if (currentFunction->nodetype == Void){
				
				printf("ERROR(%d): Function '%s' at line %d is expecting no return value but return has return value.\n", lineno, currentFunction->token->tokenstr, currentFunction->lineno);
				++*numErrors;
				break;
			}

			if (currentFunction->nodetype != Cnode->nodetype){
			
				printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but got type %s.\n", lineno, currentFunction->token->tokenstr, currentFunction->lineno, typeList[currentFunction->nodetype].c_str(), typeList[Cnode->nodetype].c_str());
				++*numErrors;

			}

		}

		else{

			if (currentFunction->nodetype != Void){
				
				printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but return has no return value.\n", lineno, currentFunction->token->tokenstr, currentFunction->lineno, typeList[currentFunction->nodetype].c_str());
				++*numErrors;

			}

		}
		
		break;
	}


	    case ElsifK:{

		TreeNode *condition = syntaxTree->child[0];

		bool CfunK = false;

		TreeNode *Cnode = checkID(condition, st, numWarnings);

		issueWarning(Cnode, numWarnings, condition->lineno);

		if (condition->kind == IdK and Cnode == NULL) break;

		if (Cnode != NULL) CfunK = checkFunK(Cnode, numErrors, condition->lineno);
		else Cnode = checkArray(condition, st, numErrors, typeList, numWarnings);

		if (Cnode == NULL) Cnode = condition;

		if (!CfunK){

			if (Cnode->nodetype != Bool){

				printf("ERROR(%d): Expecting Boolean test condition in elsif statement but got type %s.\n", condition->lineno, typeList[Cnode->nodetype].c_str()); 
				++*numErrors;
			}

			if (Cnode->isArray == true){

				printf("ERROR(%d): Cannot use array as test condition in elsif statement.\n", condition->lineno); 
				++*numErrors;

			}

		}

		
		
		
		break;

	}
	    case LoopK:

		inLoop++;

		st.enter("Loop " + (std::string)syntaxTree->child[0]->token->tokenstr);
		addSymbolTable(st, syntaxTree->child[0], symbolNames, symbolStack, numErrors);


		break;

	    case LoopForeverK:

		inLoop++;
		
		break;

	    case WhileK:{

		inLoop++;

		TreeNode *condition = syntaxTree->child[0];

		bool CfunK = false;

		TreeNode *Cnode = checkID(condition, st, numWarnings);

		issueWarning(Cnode, numWarnings, condition->lineno);

		if (condition->kind == IdK and Cnode == NULL) break;

		if (Cnode != NULL) CfunK = checkFunK(Cnode, numErrors, condition->lineno);
		else Cnode = checkArray(condition, st, numErrors, typeList, numWarnings);

		if (Cnode == NULL) Cnode = condition;

		if (!CfunK){

			if (Cnode->nodetype != Bool){

				printf("ERROR(%d): Expecting Boolean test condition in while statement but got type %s.\n", condition->lineno, typeList[Cnode->nodetype].c_str()); 
				++*numErrors;
			}

			if (Cnode->isArray == true){

				printf("ERROR(%d): Cannot use array as test condition in while statement.\n", condition->lineno); 
				++*numErrors;

			}

		}

		
		
		
		break;

	}

	    case RangeK:{

		TreeNode *R1 = syntaxTree->child[0];
		TreeNode *R2 = syntaxTree->child[1];
		TreeNode *R3 = syntaxTree->child[2];

		bool R1funK = false;
		bool R2funK = false;
		bool R3funK = false;

		TreeNode *R1node = checkID(R1, st, numWarnings);
		TreeNode *R2node = checkID(R2, st, numWarnings);

		issueWarning(R1node, numWarnings, R1->lineno);
		issueWarning(R2node, numWarnings, R2->lineno);




		if (R1->kind == IdK and R1node == NULL) break;

		if (R1node != NULL) R1funK = checkFunK(R1node, numErrors, R1->lineno);
		else R1node = checkArray(R1, st, numErrors, typeList, numWarnings);

		if (R1node == NULL) R1node = R1;

		//printf("%s  %s\n", R1->token->tokenstr, typeList[R1node->nodetype].c_str());
		if (R1node->nodetype != Int){

			printf("ERROR(%d): Expecting integer in range for loop statement but got type %s.\n", R1->lineno, typeList[R1node->nodetype].c_str()); 
			++*numErrors;
		}




		if (R2->kind == IdK and R2node == NULL) break;

		if (R2node != NULL) R2funK = checkFunK(R2node, numErrors, R2->lineno);
		else R2node = checkArray(R2, st, numErrors, typeList, numWarnings);

		if (R2node == NULL) R2node = R2;

		if (R2node->nodetype != Int){

			printf("ERROR(%d): Expecting integer in range for loop statement but got type %s.\n", R2->lineno, typeList[R2node->nodetype].c_str()); 
			++*numErrors;
		}

		if (R1node->isArray == true){
			printf("ERROR(%d): Cannot use array in range for loop statement.\n", syntaxTree->lineno);
			++*numErrors;
		}

		if (R2node->isArray == true){
			printf("ERROR(%d): Cannot use array in range for loop statement.\n", syntaxTree->lineno);
			++*numErrors;
		}




		if (R3 != NULL){

			TreeNode *R3node = checkID(R3, st, numWarnings);

			issueWarning(R3node, numWarnings, R3->lineno);

			if (R3->kind == IdK and R3node == NULL) break;

			if (R3node != NULL) R3funK = checkFunK(R3node, numErrors, R3->lineno);
			else R3node = checkArray(R3, st, numErrors, typeList, numWarnings);

			if (R3node == NULL) R3node = R3;

			if (R3node->nodetype != Int){

				printf("ERROR(%d): Expecting integer in range for loop statement but got type %s.\n", R3->lineno, typeList[R3node->nodetype].c_str()); 
				++*numErrors;
			}

			if (R3node->isArray == true){
			printf("ERROR(%d): Cannot use array in range for loop statement.\n", syntaxTree->lineno);
			++*numErrors;
			}

		}
		

		break;

	}

	    case IfK:{

		TreeNode *condition = syntaxTree->child[0];

		bool CfunK = false;

		TreeNode *Cnode = checkID(condition, st, numWarnings);

		issueWarning(Cnode, numWarnings, condition->lineno);

		if (condition->kind == IdK and Cnode == NULL) break;

		if (Cnode != NULL) CfunK = checkFunK(Cnode, numErrors, condition->lineno);
		else Cnode = checkArray(condition, st, numErrors, typeList, numWarnings);

		if (Cnode == NULL) Cnode = condition;

		if (!CfunK){

			if (Cnode->nodetype != Bool){

				printf("ERROR(%d): Expecting Boolean test condition in if statement but got type %s.\n", condition->lineno, typeList[Cnode->nodetype].c_str()); 
				++*numErrors;
			}

			if (Cnode->isArray == true){

				printf("ERROR(%d): Cannot use array as test condition in if statement.\n", condition->lineno); 
				++*numErrors;

			}

		}

		
		
		
		break;

	}

	    case CompoundK:{

		    TreeNode *node;

		    for (int i = 0; i < symbolStack->size(); i++){

			std::string symbolName = (*symbolStack)[i];

			if (st.lookup(symbolName)){
			    node = (TreeNode *)st.lookup(symbolName);
			    if (!node->isUsed){

				std::string kindStr;
				if (node->kind == ParamK) kindStr = "parameter";
				if (node->kind == FunK) kindStr = "function";
				if (node->kind == VarK) kindStr = "variable";

				printf("WARNING(%d): The %s '%s' seems not to be used.\n", node->lineno, kindStr.c_str(), node->token->tokenstr);
				++*numWarnings;
			    }
			}
		    }

		symbolStack->clear();

		st.enter("Compound");
		
		
		break;

	}

	    case AssignK:{

		std::string assignStr = (std::string)syntaxTree->token->tokenstr;

		if (assignStr == "="){

			TreeNode *LHS = syntaxTree->child[0];
			TreeNode *RHS = syntaxTree->child[1];

			bool LfunK = false;
			bool RfunK = false;
			bool matching;

			TreeNode *Lnode = checkID(LHS, st, numWarnings);

			TreeNode *Rnode = checkID(RHS, st, numWarnings);

			issueWarning(Rnode, numWarnings, RHS->lineno);


			if ((LHS->kind == IdK and Lnode == NULL) or (RHS->kind == IdK and Rnode == NULL)){
				break;
			}

			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, RHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList, numWarnings);

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList, numWarnings);

			if (Lnode == NULL) Lnode = LHS;
			if (Rnode == NULL) Rnode = RHS;

			syntaxTree->nodetype = Lnode->nodetype;
			Lnode->isInitialized = true;
		
			/*if (Lnode != NULL)
				printf("Types(%d): LHS %s\n", syntaxTree->lineno, typeList[Lnode->nodetype].c_str());
			if (Rnode != NULL)
				printf("Types(%d): RHS %s\n", syntaxTree->lineno, typeList[Rnode->nodetype].c_str());*/

			if (!LfunK and !RfunK){


			TreeNode *tempNode = Rnode;
			TreeNode *typeNode = NULL;

			while ((std::string)tempNode->token->tokenstr == "="){

				typeNode = tempNode->child[0];
				tempNode = tempNode->child[1];

			}
			if (typeNode != NULL){

				TreeNode *finalType = checkID(typeNode, st, numWarnings);

				if (finalType != NULL) LfunK = checkFunK(finalType, numErrors, typeNode->lineno);
				else finalType = checkArray(LHS, st, numErrors, typeList, numWarnings);

				if (finalType == NULL) finalType = typeNode;

				Rnode->nodetype = finalType->nodetype;

			}
				
			matching = checkSameTypes(assignStr, Lnode, Rnode, numErrors, typeList, syntaxTree->lineno);
			}

		}



		if (assignStr == "+=" or assignStr == "*=" or assignStr == "-=" or assignStr == "/="){

			TreeNode *LHS = syntaxTree->child[0];
			TreeNode *RHS = syntaxTree->child[1];

			bool LfunK = false;
			bool RfunK = false;
			bool matching;
			bool opMatch;

			TreeNode *Lnode = checkID(LHS, st, numWarnings);
			TreeNode *Rnode = checkID(RHS, st, numWarnings);

			issueWarning(Rnode, numWarnings, RHS->lineno);

			if ((LHS->kind == IdK and Lnode == NULL) or (RHS->kind == IdK and Rnode == NULL)){
				break;
			}


			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, RHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList, numWarnings);

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList, numWarnings);

			if (Lnode == NULL) Lnode = LHS;
			if (Rnode == NULL) Rnode = RHS;

			if (!LfunK and !RfunK){
			
				opMatch = checkOpTypes(syntaxTree, Lnode, Rnode, numErrors, typeList);

				if (opMatch){
					matching = checkSameTypes(assignStr, Lnode, Rnode, numErrors, typeList, syntaxTree->lineno);
				}

			}

		}


		if (assignStr == "++" or assignStr == "--"){

			TreeNode *LHS = syntaxTree->child[0];

			bool LfunK = false;

			TreeNode *Lnode = checkID(LHS, st, numWarnings);

			if (LHS->kind == IdK and Lnode == NULL) break;


			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, LHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList, numWarnings);

			if (Lnode == NULL) Lnode = LHS;

			if (!LfunK){
			checkOpTypesLeft(syntaxTree, Lnode, numErrors, typeList);
			}

		}

		
		break;
	}


	    case OpK:{

		std::string expStr = (std::string)syntaxTree->token->tokenstr;

		if (expStr == "+" or expStr == "*" or expStr == "-" or expStr == "/" or expStr == "%" or expStr == "and" or expStr == "or"){

			TreeNode *LHS = syntaxTree->child[0];
			TreeNode *RHS = syntaxTree->child[1];

			bool LfunK = false;
			bool RfunK = false;
			bool matching;
			bool opMatch;

			TreeNode *Lnode = checkID(LHS, st, numWarnings);
			TreeNode *Rnode = checkID(RHS, st, numWarnings);

			issueWarning(Lnode, numWarnings, LHS->lineno);
			issueWarning(Rnode, numWarnings, RHS->lineno);

			if ((LHS->kind == IdK and Lnode == NULL) or (RHS->kind == IdK and Rnode == NULL)){
				break;
			}


			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, RHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList, numWarnings);

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList, numWarnings);

			if (Lnode == NULL) Lnode = LHS;
			if (Rnode == NULL) Rnode = RHS;

			if (!LfunK and !RfunK){

				if (Rnode->isArray == true and (std::string)RHS->token->tokenstr != "["){

				printf("ERROR(%d): The operation '%s' does not work with arrays.\n", RHS->lineno, expStr.c_str());
				++*numErrors;
				}

			
				opMatch = checkOpTypes(syntaxTree, Lnode, Rnode, numErrors, typeList);

				if (opMatch){
					matching = checkSameTypes(expStr, Lnode, Rnode, numErrors, typeList, syntaxTree->lineno);
				}

			}

		}


		if (expStr == "==" or expStr == "!=" or expStr == "<" or expStr == ">" or expStr == "<=" or expStr == ">="){

			TreeNode *LHS = syntaxTree->child[0];
			TreeNode *RHS = syntaxTree->child[1];

			bool LfunK = false;
			bool RfunK = false;
			bool matching;
			bool opMatch;

			TreeNode *Lnode = checkID(LHS, st, numWarnings);
			TreeNode *Rnode = checkID(RHS, st, numWarnings);

			issueWarning(Lnode, numWarnings, LHS->lineno);
			issueWarning(Rnode, numWarnings, RHS->lineno);

			if ((LHS->kind == IdK and Lnode == NULL) or (RHS->kind == IdK and Rnode == NULL)){
				break;
			}


			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, RHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList, numWarnings);

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList, numWarnings);

			if (Lnode == NULL) Lnode = LHS;
			if (Rnode == NULL) Rnode = RHS;

			if (!LfunK and !RfunK){

				if (Rnode->isArray == true and (expStr != "==" and expStr != "!=")){

				printf("ERROR(%d): The operation '%s' does not work with arrays.\n", RHS->lineno, expStr.c_str());
				++*numErrors;
				}

				if (expStr == "==" or expStr == "!="){

				matching = checkSameTypes(expStr, Lnode, Rnode, numErrors, typeList, syntaxTree->lineno);
				if (matching){	

				opMatch = checkOpTypesRel(syntaxTree, Lnode, Rnode, numErrors, typeList);	
				
				}
				}
				else{

				opMatch = checkOpTypesRel(syntaxTree, Lnode, Rnode, numErrors, typeList);
				if (opMatch){	

				matching = checkSameTypes(expStr, Lnode, Rnode, numErrors, typeList, syntaxTree->lineno);	
				
				}


				}
				

			}

		}


		if (expStr == "["){

			TreeNode *LHS = checkArrayPrint(syntaxTree, st, numErrors, typeList, numWarnings);

			if (LHS != NULL){

				syntaxTree->nodetype = LHS->nodetype;
			}
		}

		
		break;
	}


	    case CallK:{

		std::string symbolName = (std::string)syntaxTree->token->tokenstr;
		int lineno = syntaxTree->lineno;

		TreeNode *node = (TreeNode*)st.lookup(symbolName);
		if (node != NULL){

			syntaxTree->nodetype = node->nodetype;
			if (node->kind != FunK){
				printf("ERROR(%d): '%s' is a simple variable and cannot be called.\n", lineno, symbolName.c_str());
				++*numErrors;
				break;

			}
			node->isUsed = true;

			TreeNode *arg = syntaxTree->child[0];
			TreeNode *param = node->child[0];

			if (arg != NULL){

			bool AfunK = false;

			TreeNode *Anode = checkID(arg, st, numWarnings);

			//issueWarning(Anode, numWarnings, arg->lineno);

			if (arg->kind == IdK and Anode == NULL) break;

			if (Anode != NULL) AfunK = checkFunK(Anode, numErrors, arg->lineno);
			else Anode = checkArray(arg, st, numErrors, typeList, numWarnings);

			if (Anode == NULL) Anode = arg;

			for (int i = 1; arg != NULL and param != NULL; i++){

				Anode = checkID(arg, st, numWarnings);

				issueWarning(Anode, numWarnings, arg->lineno);

				if (arg->kind == IdK and Anode == NULL) break;

				if (Anode != NULL) AfunK = checkFunK(Anode, numErrors, arg->lineno);
				else Anode = checkArray(arg, st, numErrors, typeList, numWarnings);

				if (Anode == NULL) Anode = arg;


				if (Anode->nodetype != param->nodetype){

				printf("ERROR(%d): Expecting type %s in parameter %i of call to '%s' declared on line %d but got type %s.\n", lineno, typeList[param->nodetype].c_str(), i, node->token->tokenstr, node->lineno, typeList[Anode->nodetype].c_str());
				++*numErrors;
				}

				if (Anode->isArray == false and param->isArray == true){
				printf("ERROR(%d): Expecting array in parameter %i of call to '%s' declared on line %d.\n", lineno, i, node->token->tokenstr, node->lineno);
				++*numErrors;

				}

				if ((std::string)arg->token->tokenstr != "[" and Anode->isArray == true and param->isArray == false){
				printf("ERROR(%d): Not expecting array in parameter %i of call to '%s' declared on line %d.\n", lineno, i, node->token->tokenstr, node->lineno);
				++*numErrors;

				}

				arg = arg->sibling;
				param = param->sibling;

			}
			}

			if (arg != NULL and param == NULL){
			
				printf("ERROR(%d): Too many parameters passed for function '%s' declared on line %d.\n", lineno, symbolName.c_str(), node->lineno);
				++*numErrors;

			}

			if (arg == NULL and param != NULL){
			
				printf("ERROR(%d): Too few parameters passed for function '%s' declared on line %d.\n", lineno, symbolName.c_str(), node->lineno);
				++*numErrors;

			}


		}
		else{

			//if (symbolName == "output" or symbolName == "outputb" or symbolName == "outputc" or symbolName == "input" or symbolName == "inputb" or symbolName == "inputc" or symbolName == "outnl") break;

			printf("ERROR(%d): Symbol '%s' is not declared.\n", syntaxTree->lineno, symbolName.c_str());
			++*numErrors;
		}
		
		
		break;
	     }



	    case IdK:{

		std::string symbolName = (std::string)syntaxTree->token->tokenstr;
		int lineno = syntaxTree->lineno;
		TreeNode *node = (TreeNode*)st.lookup(symbolName);

		if (node != NULL){

			checkFunKPrint(node, numErrors, syntaxTree->lineno);
			syntaxTree->nodetype = node->nodetype;
			node->isUsed = true;
		}

		else{
			printf("ERROR(%d): Symbol '%s' is not declared.\n", syntaxTree->lineno, symbolName.c_str());
			++*numErrors;
		}
		
		
		break;
	     }



	    case UnaryK:{

		std::string expStr = (std::string)syntaxTree->token->tokenstr;

		if (expStr == "-" or expStr == "?" or expStr == "not"){

			TreeNode *RHS = syntaxTree->child[0];

			bool RfunK = false;
			bool opMatch;

			TreeNode *Rnode = checkID(RHS, st, numWarnings);

			issueWarning(Rnode, numWarnings, RHS->lineno);

			if (RHS->kind == IdK and Rnode == NULL) break;

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList, numWarnings);

			if (Rnode == NULL) Rnode = RHS;

			if (!RfunK){
				opMatch = checkOpTypesUnary(syntaxTree, Rnode, numErrors, typeList);

				//if (opMatch){

				if (Rnode->isArray == true and (std::string)RHS->token->tokenstr != "["){
				

				printf("ERROR(%d): The operation '%s' does not work with arrays.\n", RHS->lineno, expStr.c_str());
				++*numErrors;
				}
				//}
			}

		}

		if (expStr == "*"){

			TreeNode *RHS = syntaxTree->child[0];

			bool RfunK = false;
			bool opMatch;

			TreeNode *Rnode = checkID(RHS, st, numWarnings);

			issueWarning(Rnode, numWarnings, RHS->lineno);

			if (RHS->kind == IdK and Rnode == NULL) break;


			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList, numWarnings);

			if (Rnode == NULL) Rnode = RHS;

			if (!RfunK){
				//opMatch = checkOpTypesUnary(syntaxTree, Rnode, numErrors, typeList);


				if (Rnode->isArray == false){

				printf("ERROR(%d): The operation '%s' only works with arrays.\n", RHS->lineno, expStr.c_str());
				++*numErrors;
				}
				
			}

		}

		
		break;
	}

	    case FunK:
		addSymbolTable(st, syntaxTree, symbolNames, symbolStack, numErrors);
		currentFunction = syntaxTree;
		st.enter("Function " + (std::string)syntaxTree->token->tokenstr);

	        break;
	    

	    case ParamK:
		addSymbolTable(st, syntaxTree, symbolNames, symbolStack, numErrors);

	        break;
	    


	    case VarK:{

		bool addOk = addSymbolTable(st, syntaxTree, symbolNames, symbolStack, numErrors);

		if (syntaxTree->child[0] != NULL){

			if (syntaxTree->child[0]->kind != ConstK and syntaxTree->child[0]->kind != OpK){

				printf("ERROR(%d): Initializer for variable '%s' is not a constant expression.\n", syntaxTree->lineno, syntaxTree->token->tokenstr);
				++*numErrors;
				break;
			}


			if (syntaxTree->nodetype != syntaxTree->child[0]->nodetype){

			printf("ERROR(%d): Variable '%s' is of type %s but is being initialized with an expression of type %s.\n", syntaxTree->lineno, syntaxTree->token->tokenstr, typeList[syntaxTree->nodetype].c_str(), typeList[syntaxTree->child[0]->nodetype].c_str());

			++*numErrors;

			}
		}

	        break;

	}
	    

	    case ConstK:
		
		break;
    }


    scopeAndType(syntaxTree->child[0], numErrors, numWarnings, st, symbolNames, symbolStack, inLoop, currentFunction, hasReturn);
    scopeAndType(syntaxTree->child[1], numErrors, numWarnings, st, symbolNames, symbolStack, inLoop, currentFunction, hasReturn);
    scopeAndType(syntaxTree->child[2], numErrors, numWarnings, st, symbolNames, symbolStack, inLoop, currentFunction, hasReturn);

    switch (syntaxTree->kind)
    {

	    case WhileK:{

		inLoop--;

		break;
	    }
	    case LoopK:{

		inLoop--;

		st.leave();
		
		break;
	    }

	    case LoopForeverK:

		inLoop--;
		
		break;

	    case FunK:{

		if (*hasReturn == false and syntaxTree->nodetype != Void){

			printf("WARNING(%d): Expecting to return type %s but function '%s' has no return statement.\n", syntaxTree->lineno, typeList[syntaxTree->nodetype].c_str(), syntaxTree->token->tokenstr);
			++*numWarnings;
		}

		*hasReturn = false;
		


		   /* TreeNode *node;

		    for (int i = 0; i < symbolStack->size(); i++){

			std::string symbolName = (*symbolStack)[i];

			if (st.lookup(symbolName)){
			    node = (TreeNode *)st.lookup(symbolName);
			    if (!node->isUsed){

				std::string kindStr;
				if (node->kind == ParamK) kindStr = "parameter";
				if (node->kind == FunK) kindStr = "function";
				if (node->kind == VarK) kindStr = "variable";

				printf("WARNING(%d): The %s '%s' seems not to be used.\n", node->lineno, kindStr.c_str(), node->token->tokenstr);
				++*numWarnings;
			    }
			}
		    }

		symbolStack->clear();*/

	
		st.leave();
		
		break;
	    }

	    case CompoundK:{

		    TreeNode *node;

		    for (int i = 0; i < symbolStack->size(); i++){

			std::string symbolName = (*symbolStack)[i];

			if (st.lookup(symbolName)){
			    node = (TreeNode *)st.lookup(symbolName);
			    if (!node->isUsed){

				std::string kindStr;
				if (node->kind == ParamK) kindStr = "parameter";
				if (node->kind == FunK) kindStr = "function";
				if (node->kind == VarK) kindStr = "variable";

				printf("WARNING(%d): The %s '%s' seems not to be used.\n", node->lineno, kindStr.c_str(), node->token->tokenstr);
				++*numWarnings;
			    }
			}
		    }

		symbolStack->clear();

		st.leave();
		
		break;
	    }
    }
    
    scopeAndType(syntaxTree->sibling, numErrors, numWarnings, st, symbolNames, symbolStack, inLoop, currentFunction, hasReturn);

}



void checkUseSymbolTable(SymbolTable st, std::vector<std::string> *symbolNames, int *numErrors, int *numWarnings) {

    bool mainFound = false;

    for (int i = 0; i < symbolNames->size(); i++){

	std::string symbolName = (*symbolNames)[i];

	if ( symbolName == "main"){
		mainFound = true;
	}
    }

    if (!mainFound){
	printf("ERROR(LINKER): Procedure main is not declared.\n");
	++*numErrors;
    }
    


}

bool addSymbolTable(SymbolTable st, TreeNode *syntaxTree, std::vector<std::string> *symbolNames, std::vector<std::string> *symbolStack, int *numErrors){

	std::string symbolName = (std::string)syntaxTree->token->tokenstr;
	int lineno = syntaxTree->lineno;

	TreeNode *node = (TreeNode*)st.lookup(symbolName);

	if (node != NULL and node->kind == ParamK){

		int prevLine = node->lineno;
		printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", lineno, symbolName.c_str(), prevLine);
		++*numErrors;
	}

	bool addOk = st.insert(symbolName, syntaxTree);

	if (!addOk){

		int prevLine = ((TreeNode*)st.lookup(symbolName))->lineno;
		printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", lineno, symbolName.c_str(), prevLine);
		++*numErrors;

	}
	else{

		symbolNames->push_back(symbolName);
		if (!st.isGlobal()){ symbolStack->push_back(symbolName); }
		else{
			if (node != NULL){
			if (node->kind == FunK){
			
				symbolStack->push_back(symbolName);
			}
			}
		}
	}

	return addOk;

}

TreeNode* checkID(TreeNode *node, SymbolTable st, int *numWarnings){

	TreeNode *actualNode = NULL;

	std::string symbolName = (std::string)node->token->tokenstr;
	actualNode = (TreeNode*)st.lookup(symbolName);

	/*if (actualNode != NULL){

		if (actualNode->isInitialized == false and actualNode->kind == VarK){

			printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", node->lineno, actualNode->token->tokenstr);
			++*numWarnings;

		}
	}*/

	return actualNode;
}

bool checkFunK(TreeNode *node, int *numErrors, int lineno){

	bool nodeGood = false;

	if (node->kind == FunK){

		nodeGood = true;
		/*std::string symbolName = (std::string)node->token->tokenstr;

		printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, symbolName.c_str());
		++*numErrors;*/
	}

	return nodeGood;

}

bool checkFunKPrint(TreeNode *node, int *numErrors, int lineno){

	bool nodeGood = false;

	if (node->kind == FunK){

		nodeGood = true;
		std::string symbolName = (std::string)node->token->tokenstr;

		printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, symbolName.c_str());
		++*numErrors;
	}

	return nodeGood;

}

TreeNode* checkArray(TreeNode *node, SymbolTable st, int *numErrors, std::map<Type, std::string> typeList, int *numWarnings){

	TreeNode *LHS = NULL;
	TreeNode *RHS = NULL;
	TreeNode *Lnode = NULL;
	TreeNode *Rnode = NULL;
	bool Lgood;
	bool Rgood;
	bool LIndex;
	bool RIndex;
	bool sameTypes;

	if ((std::string)node->token->tokenstr == "["){

		LHS = node->child[0];
		RHS = node->child[1];
		
		Lnode = checkID(LHS, st, numWarnings);

		//issueWarning(Lnode, numWarnings, LHS->lineno);

		if (LHS->kind == IdK and Lnode == NULL) return Lnode;

		if (Lnode != NULL) Lgood = checkFunK(Lnode, numErrors, LHS->lineno);
		

		if (Lnode != NULL){
			if (Lnode->isArray == false){

				/*std::string symbolName = (std::string)Lnode->token->tokenstr;
				int lineno = LHS->lineno;
				printf("ERROR(%d): Cannot index nonarray '%s'.\n", lineno, symbolName.c_str());
				++*numErrors;*/
			}
		}
		

		if ((std::string)RHS->token->tokenstr == "["){

			Rnode = checkArray(RHS, st, numErrors, typeList, numWarnings);
		}
		else{
		
			if (RHS->kind == IdK){

				//Rnode = checkID(RHS, st, numWarnings);

				issueWarning(Rnode, numWarnings, RHS->lineno);

				if (Rnode == NULL) return Rnode;

				if (Rnode != NULL) Rgood = checkFunK(Rnode, numErrors, RHS->lineno);
				
				if (Rnode != NULL){

					if (Rnode->isArray == true){
					/*std::string symbolName = (std::string)Rnode->token->tokenstr;
					int lineno = RHS->lineno;
					printf("ERROR(%d): Array index is the unindexed array '%s'.\n", lineno, symbolName.c_str());
					++*numErrors;*/
					}
				}
				
			}
			else{
				Rnode = RHS;
			}
		}

		if (Rnode != NULL){
			if (Rnode->nodetype != Int){
			
				/*std::string symbolName = (std::string)LHS->token->tokenstr;
				int lineno = RHS->lineno;
				printf("ERROR(%d): Array '%s' should be indexed by type int but got %s.\n", lineno, symbolName.c_str(), typeList[Rnode->nodetype].c_str());
				++*numErrors;*/
			} 
		}

	}

	return Lnode;

}


TreeNode* checkArrayPrint(TreeNode *node, SymbolTable st, int *numErrors, std::map<Type, std::string> typeList, int *numWarnings){

	TreeNode *LHS = NULL;
	TreeNode *RHS = NULL;
	TreeNode *Lnode = NULL;
	TreeNode *Rnode = NULL;
	bool Lgood;
	bool Rgood;
	bool LIndex;
	bool RIndex;
	bool sameTypes;

	if ((std::string)node->token->tokenstr == "["){

		LHS = node->child[0];
		RHS = node->child[1];
		
		Lnode = checkID(LHS, st, numWarnings);
		if (Lnode != NULL) Lgood = checkFunK(Lnode, numErrors, LHS->lineno);
		

		if (Lnode != NULL){
			if (Lnode->isArray == false){

				std::string symbolName = (std::string)Lnode->token->tokenstr;
				int lineno = LHS->lineno;
				printf("ERROR(%d): Cannot index nonarray '%s'.\n", lineno, symbolName.c_str());
				++*numErrors;
			}
		}
		

		if ((std::string)RHS->token->tokenstr == "["){

			Rnode = checkArray(RHS, st, numErrors, typeList, numWarnings);
		}
		else{
		
			if (RHS->kind == IdK){

				Rnode = checkID(RHS, st, numWarnings);
				if (Rnode != NULL) Rgood = checkFunK(Rnode, numErrors, RHS->lineno);
				
				if (Rnode != NULL){

					if (Rnode->isArray == true){
					std::string symbolName = (std::string)Rnode->token->tokenstr;
					int lineno = RHS->lineno;
					printf("ERROR(%d): Array index is the unindexed array '%s'.\n", lineno, symbolName.c_str());
					++*numErrors;
					}
				}
				
			}
			else{
				Rnode = RHS;
			}
		}

		if (Rnode != NULL){
			if (Rnode->nodetype != Int){
			
				std::string symbolName = (std::string)LHS->token->tokenstr;
				int lineno = RHS->lineno;
				printf("ERROR(%d): Array '%s' should be indexed by type int but got type %s.\n", lineno, symbolName.c_str(), typeList[Rnode->nodetype].c_str());
				++*numErrors;
			} 
		}

	}

	return Lnode;

}


bool checkSameTypes(std::string op, TreeNode *Lnode, TreeNode *Rnode, int *numErrors, std::map<Type, std::string> typeList, int lineno){

	bool typesGood = true;

	if (Lnode->nodetype != Rnode->nodetype){

		printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", lineno, op.c_str(), typeList[Lnode->nodetype].c_str(), typeList[Rnode->nodetype].c_str());
		++*numErrors;
		typesGood = false;
	}

	return typesGood;
}


bool checkOpTypes(TreeNode *syntaxTree, TreeNode *Lnode, TreeNode *Rnode, int *numErrors, std::map<Type, std::string> typeList){

	bool goodTypes = true;

	if (Lnode->nodetype != syntaxTree->nodetype){

		printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n", syntaxTree->lineno, syntaxTree->token->tokenstr, typeList[syntaxTree->nodetype].c_str(), typeList[Lnode->nodetype].c_str());
		++*numErrors;
		goodTypes = false;

	}

	if (Rnode->nodetype != syntaxTree->nodetype){

		printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n", syntaxTree->lineno, syntaxTree->token->tokenstr, typeList[syntaxTree->nodetype].c_str(), typeList[Rnode->nodetype].c_str());
		++*numErrors;
		goodTypes = false;

	}
	return goodTypes;

}

bool checkOpTypesRel(TreeNode *syntaxTree, TreeNode *Lnode, TreeNode *Rnode, int *numErrors, std::map<Type, std::string> typeList){

	bool goodTypes = true;

	if (Lnode->nodetype != Int and Lnode->nodetype != Char){

		printf("ERROR(%d): '%s' requires operands of type char or type int but lhs is of type %s.\n", syntaxTree->lineno, syntaxTree->token->tokenstr, typeList[Lnode->nodetype].c_str());
		++*numErrors;
		goodTypes = false;

	}

	if (Rnode->nodetype != Int and Rnode->nodetype != Char){

		printf("ERROR(%d): '%s' requires operands of type char or type int but rhs is of type %s.\n", syntaxTree->lineno, syntaxTree->token->tokenstr, typeList[Rnode->nodetype].c_str());
		++*numErrors;
		goodTypes = false;

	}
	return goodTypes;


}


bool checkOpTypesLeft(TreeNode *syntaxTree, TreeNode *Lnode, int *numErrors, std::map<Type, std::string> typeList){

	bool typesGood = true;

	if (Lnode->nodetype != syntaxTree->nodetype){

		printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n", syntaxTree->lineno, syntaxTree->token->tokenstr, typeList[syntaxTree->nodetype].c_str(), typeList[Lnode->nodetype].c_str());
		++*numErrors;
		typesGood = false;
	}

	return typesGood;
}

bool checkOpTypesRight(TreeNode *syntaxTree, TreeNode *Rnode, int *numErrors, std::map<Type, std::string> typeList){

	bool typesGood = true;

	if (Rnode->nodetype != syntaxTree->nodetype){

		printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n", syntaxTree->lineno, syntaxTree->token->tokenstr, typeList[syntaxTree->nodetype].c_str(), typeList[Rnode->nodetype].c_str());
		++*numErrors;
		typesGood = false;
	}

	return typesGood;
}

bool checkOpTypesUnary(TreeNode *syntaxTree, TreeNode *Rnode, int *numErrors, std::map<Type, std::string> typeList){

	bool typesGood = true;

	if (Rnode->nodetype != syntaxTree->nodetype){

		printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given type %s.\n", syntaxTree->lineno, syntaxTree->token->tokenstr, typeList[syntaxTree->nodetype].c_str(), typeList[Rnode->nodetype].c_str());
		++*numErrors;
		typesGood = false;
	}

	return typesGood;
}
	

void issueWarning(TreeNode *node, int *numWarnings, int lineno){

	if (node != NULL){

		if (node->isInitialized == false and node->kind == VarK and node->hasIssued == false){

			printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", lineno, node->token->tokenstr);
			++*numWarnings;
			node->hasIssued = true;

		}
	}


}


void pointerPrintAddr(void* data) {
    printf("0x%016llx ", (unsigned long long int)(data));
}

void pointerPrintLongInteger(void* data) {
    printf("%18lld ", (unsigned long long int)(data));
}

void pointerPrintStr(void* data) { printf("%s ", (char*)(data)); }

// // // // // // // // // // // // // // // // // // // //
//
// Class: Scope
//

Scope::Scope(std::string newname) {
    name = newname;
    debugFlg = false;
}

Scope::~Scope() {}

void Scope::debug(bool state) { debugFlg = state; }

void Scope::print(void (*printData)(void*)) {
    printf("Scope: %-15s -----------------\n", name.c_str());
    for (std::map<std::string, void*>::iterator it = symbols.begin();
         it != symbols.end(); it++) {
        printf("%20s: ", (it->first).c_str());
        printData(it->second);
        printf("\n");
    }
}



void Scope::applyToAll(void (*action)(std::string, void*)) {
    for (std::map<std::string, void*>::iterator it = symbols.begin();
         it != symbols.end(); it++) {
        action(it->first, it->second);
    }
}

// returns true if insert was successful and false if symbol already in this
// scope
bool Scope::insert(std::string sym, void* ptr) {
    if (symbols.find(sym) == symbols.end()) {
        if (debugFlg)
            printf("DEBUG(Scope): insert in \"%s\" the symbol \"%s\".\n",
                   name.c_str(), sym.c_str());
        symbols[sym] = ptr;
        return true;
    } else {
        if (debugFlg)
            printf("DEBUG(Scope): insert in \"%s\" the symbol \"%s\" but "
                   "symbol already there!\n",
                   name.c_str(), sym.c_str());
        return false;
    }
}

void* Scope::lookup(std::string sym) {
    if (symbols.find(sym) != symbols.end()) {
        if (debugFlg)
            printf("DEBUG(Scope): lookup in \"%s\" the symbol \"%s\" and found "
                   "it.\n",
                   name.c_str(), sym.c_str());
        return symbols[sym];
    } else {
        if (debugFlg)
            printf("DEBUG(Scope): lookup in \"%s\" the symbol \"%s\" and did "
                   "NOT find it.\n",
                   name.c_str(), sym.c_str());
        return NULL;
    }
}

bool Scope::debugFlg;

// // // // // // // // // // // // // // // // // // // //
//
// Class: SymbolTable
//
//  This is a stack of scopes that represents a symbol table
//

SymbolTable::SymbolTable() {
    enter((std::string) "Global");
    debugFlg = false;
}

void SymbolTable::debug(bool state) { debugFlg = state; }

// Returns the number of scopes in the symbol table
int SymbolTable::depth() { return stack.size(); }

// returns flag if the stack is only the global scope
bool SymbolTable::isGlobal() { return stack.size() == 1; }

// print all scopes using data printing func
void SymbolTable::print(void (*printData)(void*)) {
    printf("===========  Symbol Table  ===========\n");
    for (std::vector<Scope*>::iterator it = stack.begin(); it != stack.end();
         it++) {
        (*it)->print(printData);
    }
    printf("===========  ============  ===========\n");
}

void SymbolTable::applyToAllGlobal(void (*action)(std::string, void*)) {
    stack[0]->applyToAll(action);
}

// Enter a scope
void SymbolTable::enter(std::string name) {

    if (debugFlg){
       // printf("DEBUG(SymbolTable): enter scope \"%s\".\n", name.c_str());
    }
    stack.push_back(new Scope(name));
}

// Leave a scope (not allowed to leave global)
void SymbolTable::leave() {

    if (debugFlg)
        printf("DEBUG(SymbolTable): leave scope \"%s\".\n",
               (stack.back()->scopeName()).c_str());
    if (stack.size() > 1) {
        delete stack.back();
        stack.pop_back();
    } else {
        printf("ERROR(SymbolTable): You cannot leave global scope.  Number of "
               "scopes: %d.\n",
               (int)stack.size());
    }
}

// Lookup a symbol anywhere in the stack of scopes
// Returns NULL if symbol not found, otherwise it returns the stored void *
// associated with the symbol
void* SymbolTable::lookup(std::string sym) {
    void* data;

    for (std::vector<Scope*>::reverse_iterator it = stack.rbegin();
         it != stack.rend(); it++) {
        data = (*it)->lookup(sym);
        if (data != NULL)
            break;
    }
    if (debugFlg)
        printf("DEBUG(SymbolTable): lookup the symbol \"%s\" and %s.\n",
               sym.c_str(),
               (data ? (char*)"found it" : (char*)"did NOT find it"));
 
    return data;
}

TreeNode* SymbolTable::lookupNode(std::string sym) {
    return (TreeNode*)lookup(sym);
}

bool SymbolTable::isInTopScope(std::string sym) {
    return (stack.back())->lookup(sym) != NULL;
}

// Lookup a symbol in the global scope
// returns NULL if symbol not found, otherwise it returns the stored void *
// associated with the symbol
void* SymbolTable::lookupGlobal(std::string sym) {
    void* data;

    data = stack[0]->lookup(sym);
    if (debugFlg)
        printf("DEBUG(SymbolTable): lookup the symbol \"%s\" and %s.\n",
               sym.c_str(), (data ? "found it" : "did NOT find it"));

    return data;
}

// Insert a symbol into the most recent scope
// Returns true if insert was successful and false if symbol already in the most
// recent scope
bool SymbolTable::insert(std::string sym, void* ptr) {
    if (debugFlg)
        printf("DEBUG(SymbolTable): insert the symbol \"%s\".\n", sym.c_str());
    return (stack.back())->insert(sym, ptr);
}

// Insert a symbol into the global scope
// Returns true is insert was successful and false if symbol already in the
// global scope
bool SymbolTable::insertGlobal(std::string sym, void* ptr) {
    if (debugFlg)
        printf("DEBUG(SymbolTable): insert the global symbol \"%s\".\n",
               sym.c_str());
    return stack[0]->insert(sym, ptr);
}



// // // // // // // // // // // // // // // // // // // //
//
// Some tests
//

/*

std::string words[] = {"alfa", "bravo",   "charlie", "dog",
                       "echo", "foxtrot", "golf"};
int wordsLen = 7;

int counter;
void countSymbols(std::string sym, void* ptr) {
    counter++;
    printf("%d %20s: ", counter, sym.c_str());
    pointerPrintAddr(ptr);
    printf("\n");
}


int main()
{
    Scope s("global");

    s.insert("dog", (char *)"woof");
    s.insert("cat", (char *)"meow");
    printf("%s\n", (char *)(s.lookup("cat")));
    printf("%s\n", (char *)(s.lookup("dog")));

    if (s.lookup("fox")==NULL) printf("not found\n");
    else printf("found\n");
    s.print(pointerPrintAddr);
    s.print(pointerPrintStr);

    SymbolTable st;

    printf("Print symbol table.\n");
    st.print(pointerPrintStr);
    st.insert("alfa", (char *)"ant");
    st.insert("bravo", (char *)"bat");
    st.insert("charlie", (char *)"cob");

    st.enter("First");
    st.insert("charlie", (char *)"cow");
    st.enter((std::string )"Second");
    st.insert("delta", (char *)"dog");
    st.insertGlobal("echo", (char *)"elk");

    printf("Print symbol table.\n");
    st.print(pointerPrintStr);


    st.leave();
    st.enter((std::string )"New Second");
    st.insert("charlie", (char *)"cat");

    printf("Print symbol table.\n");
    st.print(pointerPrintStr);
    fflush(stdout);


    printf("\nGeneral Lookup\n");
    for (int i=0; i<wordsLen; i++) {
        void *data;

        if ((data = st.lookup(words[i]))==NULL) printf("%s: %s\n",
words[i].c_str(), (char *)"NULL");
        else printf("%s: %s\n", words[i].c_str(), (char *)data);
    }

    printf("\nGlobal Lookup\n");
    for (int i=0; i<wordsLen; i++) {
        void *data;

        if ((data = st.lookupGlobal(words[i]))==NULL) printf("%s: %s\n",
words[i].c_str(), (char *)"NULL");
        else printf("%s: %s\n", words[i].c_str(), (char *)data);
    }

    printf("Test that apply works.\n");
    counter = 0;
    st.applyToAllGlobal(countSymbols);
    printf("Number of global symbols: %d\n", counter);

    st.insert((char *)"gnu", (char *)"goat");
    st.lookup((char *)"gnu");

    st.insertGlobal((char *)"gnu", (char *)"grebe");
    st.lookup((char *)"gnu");
    st.lookupGlobal((char *)"gnu");

    return 0;
}
*/
