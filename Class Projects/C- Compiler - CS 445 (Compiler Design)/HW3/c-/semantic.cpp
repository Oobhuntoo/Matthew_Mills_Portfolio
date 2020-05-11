#include "semantic.h"

// // // // // // // // // // // // // // // // // // // //
//
// Some sample void * printing routines.   User shoud supply their own.
//

void scopeAndType(TreeNode *syntaxTree, int *numErrors, int *numWarnings, SymbolTable st, std::vector<std::string> *symbolNames, std::vector<std::string> *symbolStack){

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
	    case BreakK:

		
		
		break;

	    case ReturnK:{

		TreeNode *childNode = syntaxTree->child[0];
		int lineno = syntaxTree->lineno;

		if (childNode != NULL){

			if (childNode->kind == IdK){
				std::string symbolName = (std::string)childNode->token->tokenstr;
				TreeNode *actualNode = (TreeNode*)st.lookup(symbolName);

				if (actualNode != NULL){

				if (actualNode->isArray == true){

				printf("ERROR(%d): Cannot return an array.\n", lineno);
				++*numErrors;
				break;
				}
				}

			}

		}
		
		break;
	}


	    case ElsifK:

		
		
		break;

	    case LoopK:


		st.enter("Loop " + (std::string)syntaxTree->child[0]->token->tokenstr);
		addSymbolTable(st, syntaxTree->child[0], symbolNames, symbolStack, numErrors);


		break;

	    case LoopForeverK:

		
		
		break;

	    case WhileK:

		
		
		break;

	    case RangeK:

		
		
		break;

	    case IfK:

		
		
		break;


	    case CompoundK:

		st.enter("Compound");

		

		
		
		break;

	    case AssignK:{

		std::string assignStr = (std::string)syntaxTree->token->tokenstr;

		if (assignStr == "="){

			TreeNode *LHS = syntaxTree->child[0];
			TreeNode *RHS = syntaxTree->child[1];

			bool LfunK = false;
			bool RfunK = false;
			bool matching;

			TreeNode *Lnode = checkID(LHS, st);
			TreeNode *Rnode = checkID(RHS, st);

			//printf("Types(%d): LHS %s RHS %s\n", syntaxTree->lineno, typeList[LHS->nodetype].c_str(), typeList[RHS->nodetype].c_str());


			if ((LHS->kind == IdK and Lnode == NULL) or (RHS->kind == IdK and Rnode == NULL)){
				break;
			}

			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, RHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList);

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList);

			if (Lnode == NULL) Lnode = LHS;
			if (Rnode == NULL) Rnode = RHS;

			syntaxTree->nodetype = Lnode->nodetype;
		
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

				TreeNode *finalType = checkID(typeNode, st);

				if (finalType != NULL) LfunK = checkFunK(finalType, numErrors, typeNode->lineno);
				else finalType = checkArray(LHS, st, numErrors, typeList);

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

			TreeNode *Lnode = checkID(LHS, st);
			TreeNode *Rnode = checkID(RHS, st);

			if ((LHS->kind == IdK and Lnode == NULL) or (RHS->kind == IdK and Rnode == NULL)){
				break;
			}


			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, RHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList);

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList);

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

			TreeNode *Lnode = checkID(LHS, st);

			if (LHS->kind == IdK and Lnode == NULL) break;


			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, LHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList);

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

			TreeNode *Lnode = checkID(LHS, st);
			TreeNode *Rnode = checkID(RHS, st);

			if ((LHS->kind == IdK and Lnode == NULL) or (RHS->kind == IdK and Rnode == NULL)){
				break;
			}


			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, RHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList);

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList);

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

			TreeNode *Lnode = checkID(LHS, st);
			TreeNode *Rnode = checkID(RHS, st);

			if ((LHS->kind == IdK and Lnode == NULL) or (RHS->kind == IdK and Rnode == NULL)){
				break;
			}


			if (Lnode != NULL) LfunK = checkFunK(Lnode, numErrors, RHS->lineno);
			else Lnode = checkArray(LHS, st, numErrors, typeList);

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList);

			if (Lnode == NULL) Lnode = LHS;
			if (Rnode == NULL) Rnode = RHS;

			if (!LfunK and !RfunK){

				if (Rnode->isArray == true and (expStr != "==" or expStr != "!=")){

				printf("ERROR(%d): The operation '%s' does not work with arrays.\n", RHS->lineno, expStr.c_str());
				++*numErrors;
				}

				opMatch = checkOpTypesRel(syntaxTree, Lnode, Rnode, numErrors, typeList);
				if (opMatch){		
				matching = checkSameTypes(expStr, Lnode, Rnode, numErrors, typeList, syntaxTree->lineno);
				}
				

			}

		}


		if (expStr == "["){

			TreeNode *LHS = checkArrayPrint(syntaxTree, st, numErrors, typeList);

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

			}
		}
		else{
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

			TreeNode *Rnode = checkID(RHS, st);

			if (RHS->kind == IdK and Rnode == NULL) break;

			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList);

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

			TreeNode *Rnode = checkID(RHS, st);

			if (RHS->kind == IdK and Rnode == NULL) break;


			if (Rnode != NULL) RfunK = checkFunK(Rnode, numErrors, RHS->lineno);
			else Rnode = checkArray(RHS, st, numErrors, typeList);

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
		st.enter("Function " + (std::string)syntaxTree->token->tokenstr);

	        break;
	    

	    case ParamK:
		addSymbolTable(st, syntaxTree, symbolNames, symbolStack, numErrors);

	        break;
	    


	    case VarK:

		addSymbolTable(st, syntaxTree, symbolNames, symbolStack, numErrors);
	        break;
	    

	    case ConstK:
		
		break;
    }


    scopeAndType(syntaxTree->child[0], numErrors, numWarnings, st, symbolNames, symbolStack);
    scopeAndType(syntaxTree->child[1], numErrors, numWarnings, st, symbolNames, symbolStack);
    scopeAndType(syntaxTree->child[2], numErrors, numWarnings, st, symbolNames, symbolStack);

    switch (syntaxTree->kind)
    {
	    case LoopK:{


		st.leave();
		
		break;
	    }

	    case FunK:{

		    TreeNode *node;

		    for (int i = 0; i < symbolStack->size(); i++){

			std::string symbolName = (*symbolStack)[i];

			if (st.lookup(symbolName)){
			    node = (TreeNode *)st.lookup(symbolName);
			    if (!node->isUsed){
				printf("WARNING(%d): The variable %s seems not to be used.\n", node->lineno, node->token->tokenstr);
				++*numWarnings;
			    }
			}
		    }

		symbolStack->clear();

	
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
				printf("WARNING(%d): The variable %s seems not to be used.\n", node->lineno, node->token->tokenstr);
				++*numWarnings;
			    }
			}
		    }

		symbolStack->clear();

		st.leave();
		
		break;
	    }
    }
    
    scopeAndType(syntaxTree->sibling, numErrors, numWarnings, st, symbolNames, symbolStack);

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

void addSymbolTable(SymbolTable st, TreeNode *syntaxTree, std::vector<std::string> *symbolNames, std::vector<std::string> *symbolStack, int *numErrors){

	std::string symbolName = (std::string)syntaxTree->token->tokenstr;
	int lineno = syntaxTree->lineno;

	TreeNode *node = (TreeNode*)st.lookup(symbolName);

	if (node != NULL and node->kind == ParamK){

		int prevLine = node->lineno;
		printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", lineno, symbolName.c_str(), prevLine);
		++*numErrors;
	}

		

	if (!st.insert(symbolName, syntaxTree)){

		int prevLine = ((TreeNode*)st.lookup(symbolName))->lineno;
		printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", lineno, symbolName.c_str(), prevLine);
		++*numErrors;

	}
	else{

		symbolNames->push_back(symbolName);
		if (!st.isGlobal()) symbolStack->push_back(symbolName);
	}

}

TreeNode* checkID(TreeNode *node, SymbolTable st){

	TreeNode *actualNode = NULL;

	std::string symbolName = (std::string)node->token->tokenstr;
	actualNode = (TreeNode*)st.lookup(symbolName);

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

TreeNode* checkArray(TreeNode *node, SymbolTable st, int *numErrors, std::map<Type, std::string> typeList){

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
		
		Lnode = checkID(LHS, st);

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

			Rnode = checkArray(RHS, st, numErrors, typeList);
		}
		else{
		
			if (RHS->kind == IdK){

				Rnode = checkID(RHS, st);

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


TreeNode* checkArrayPrint(TreeNode *node, SymbolTable st, int *numErrors, std::map<Type, std::string> typeList){

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
		
		Lnode = checkID(LHS, st);
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

			Rnode = checkArray(RHS, st, numErrors, typeList);
		}
		else{
		
			if (RHS->kind == IdK){

				Rnode = checkID(RHS, st);
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
