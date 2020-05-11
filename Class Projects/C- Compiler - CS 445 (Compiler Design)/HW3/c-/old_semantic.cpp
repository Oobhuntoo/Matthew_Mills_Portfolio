#include "semantic.h"

// // // // // // // // // // // // // // // // // // // //
//
// Some sample void * printing routines.   User shoud supply their own.
//

void scopeAndType(TreeNode *syntaxTree, int *numErrors, int *numWarnings, SymbolTable st, std::vector<std::string> *symbolNames, std::vector<std::string> *symbolStack){

std::map<Type, std::string> typeList;
typeList[Int] = "int";
typeList[Char] = "char";
typeList[Bool] = "bool";
typeList[Void] = "void";
typeList[Undef] = "undefined";

    if (!syntaxTree)
	return;

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

				if (childNode->isInitialized == false and syntaxTree->child[0]->kind == IdK){
				printf("WARNING(%d): Variable %s may be uninitialized when used here.\n", lineno, symbolName.c_str());
				++*numWarnings;
				}
			}

		}
		
		break;

}

	    case ElsifK:

		
		
		break;

	    case LoopK:


		st.enter("Loop " + (std::string)syntaxTree->child[0]->token->tokenstr);



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

		if (syntaxTree->child[1] != NULL){

		Kind LHSKind = syntaxTree->child[0]->kind;
		Kind RHSKind = syntaxTree->child[1]->kind;
		bool LHS = true;

		int lineno = syntaxTree->lineno;
		std::string LHSsymbolName;

		if (LHSKind == IdK){
			LHSsymbolName = (std::string)syntaxTree->child[0]->token->tokenstr;
		}
		if (LHSKind == OpK){
			if ((std::string)syntaxTree->child[0]->token->tokenstr == "["){
				LHSsymbolName = (std::string)syntaxTree->child[0]->child[0]->token->tokenstr;
			
			}
		}


		if (!st.lookup(LHSsymbolName)){

			LHS = false;
		}
	

		TreeNode *RHSnode;
		std::string RHSsymbolName;

		if (RHSKind == IdK or RHSKind == CallK){

			RHSsymbolName = (std::string)syntaxTree->child[1]->token->tokenstr;

			if (!st.lookup(RHSsymbolName)){

				break;
			}
			RHSnode = (TreeNode*)st.lookup(RHSsymbolName);
		}
		else{
			RHSnode = syntaxTree->child[1];
		}

		if (LHS){

			TreeNode *LHSnode = (TreeNode*)st.lookup(LHSsymbolName);
			LHSnode->isInitialized = true;
			LHSnode->isUsed = true;
			RHSnode->isUsed = true;

			Kind LHSactualKind = LHSnode->kind;
			Kind RHSactualKind = RHSnode->kind;
			Type LHSactualType = LHSnode->nodetype;
			Type RHSactualType = RHSnode->nodetype;
	
			if (LHSactualKind == FunK or RHSactualKind == FunK){
			if (LHSactualKind == FunK){
				printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, LHSsymbolName.c_str());
				++*numErrors;
			}
			if (RHSactualKind == FunK){
				printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, RHSsymbolName.c_str());
				++*numErrors;

			}
			break;
			}
		
			syntaxTree->nodetype = LHSactualType;

			if (RHSnode->isInitialized == false and syntaxTree->child[1]->kind == IdK){
			printf("WARNING(%d): Variable %s may be uninitialized when used here.\n", lineno, RHSsymbolName.c_str());
			++*numWarnings;
			}

			std::string assignStr = (std::string)syntaxTree->token->tokenstr;
			if (assignStr == "+=" or assignStr == "-=" or assignStr == "*=" or assignStr == "/="){
			if (LHSactualType != Int or RHSactualType != Int){
			if (LHSactualType != Int){
			printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n"
, syntaxTree->lineno, assignStr.c_str(), typeList[Int].c_str(), typeList[LHSactualType].c_str());
			++*numErrors;
			}

			if (RHSactualType != Int){
			printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n"
, syntaxTree->lineno, assignStr.c_str(), typeList[Int].c_str(), typeList[RHSactualType].c_str());
			++*numErrors;
			}
			break;
			}
			}

			if (LHSactualType != RHSactualType){

				printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", lineno, syntaxTree->token->tokenstr, typeList[LHSactualType].c_str(), typeList[RHSactualType].c_str());
				++*numErrors;

			}
		}
		}

		else{

		Kind LHSKind = syntaxTree->child[0]->kind;

		int lineno = syntaxTree->lineno;
		std::string LHSsymbolName;

		if (LHSKind == IdK){
			LHSsymbolName = (std::string)syntaxTree->child[0]->token->tokenstr;
		}
		if (LHSKind == OpK){
			if ((std::string)syntaxTree->child[0]->token->tokenstr == "["){
				LHSsymbolName = (std::string)syntaxTree->child[0]->child[0]->token->tokenstr;
			}
		}

		TreeNode *LHSnode = (TreeNode*)st.lookup(LHSsymbolName);

		if (LHSnode != NULL){

			LHSnode->isUsed = true;
			Type LHSactualType = LHSnode->nodetype;

			if (LHSactualType != Int){
				printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n", syntaxTree->lineno, syntaxTree->token->tokenstr, typeList[Int].c_str(), typeList[LHSactualType].c_str());
				++*numErrors;
			}
		}


		}

		
		break;
	    }

	    case OpK:{

		Kind LHSKind = syntaxTree->child[0]->kind;
		Kind RHSKind = syntaxTree->child[1]->kind;

		int lineno = syntaxTree->lineno;
		std::string LHSsymbolName;
		std::string RHSsymbolName;

		TreeNode *LHSnode;
		TreeNode *RHSnode;

		if ((std::string)syntaxTree->token->tokenstr == "["){
			std::string symbolName = (std::string)syntaxTree->child[0]->token->tokenstr;
			TreeNode *node = (TreeNode*)st.lookup(symbolName);

			if (node != NULL){
				syntaxTree->nodetype = node->nodetype;
				node->isUsed = true;

				if (node->kind == FunK){
					printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, symbolName.c_str());
					++*numErrors;

				}
				if (node->isArray == false){
					printf("ERROR(%d): Cannot index nonarray '%s'.\n", lineno, symbolName.c_str());
					++*numErrors;
				}
			}
			else{
				break;
			}


			if (syntaxTree->child[1]->kind == IdK){
			std::string RHSsymbolName = (std::string)syntaxTree->child[1]->token->tokenstr;
			TreeNode *RHSnode = (TreeNode*)st.lookup(RHSsymbolName);

			if (RHSnode != NULL){

				if (RHSnode->kind == FunK){
					printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, RHSsymbolName.c_str());
					++*numErrors;

				}
				syntaxTree->child[1]->nodetype = RHSnode->nodetype;
			}
			else{
				break;
			}
			}



			if (syntaxTree->child[1]->nodetype != Int){
			printf("ERROR(%d): Array '%s' should be indexed by type int but got %s.\n", lineno, symbolName.c_str(), typeList[syntaxTree->child[1]->nodetype].c_str());
			++*numErrors;
			}
			if (syntaxTree->child[1]->kind == IdK){

			std::string childName = (std::string)syntaxTree->child[1]->token->tokenstr;
			TreeNode *childNode = (TreeNode*)st.lookup(childName);

			if (childNode != NULL){

				childNode->isUsed = true;
				if (childNode->isArray){
				printf("ERROR(%d): Array index is the unindexed array '%s'.\n", lineno, childName.c_str());
				++*numErrors;
				}
			}
			}


			break;
		}

		if (LHSKind == IdK){
			LHSsymbolName = (std::string)syntaxTree->child[0]->token->tokenstr;
			LHSnode = (TreeNode*)st.lookup(LHSsymbolName);
				
		}
		else{
			if ((std::string)syntaxTree->child[0]->token->tokenstr == (std::string)"["){
				LHSsymbolName = (std::string)syntaxTree->child[0]->child[0]->token->tokenstr;
				LHSnode = (TreeNode*)st.lookup(LHSsymbolName);
			}
			else{
				LHSnode = syntaxTree->child[0];
			}
		}

		if (RHSKind == IdK){
			RHSsymbolName = (std::string)syntaxTree->child[1]->token->tokenstr;
			RHSnode = (TreeNode*)st.lookup(RHSsymbolName);
				
		}
		else{
			if ((std::string)syntaxTree->child[1]->token->tokenstr == (std::string)"["){
				RHSsymbolName = (std::string)syntaxTree->child[1]->child[0]->token->tokenstr;
				RHSnode = (TreeNode*)st.lookup(RHSsymbolName);
			}
			else{
				RHSnode = syntaxTree->child[1];
			}
		}



		if (LHSnode != NULL and RHSnode != NULL){

	 		Kind LHSactualKind = LHSnode->kind;
			Kind RHSactualKind = RHSnode->kind;
			Type LHSactualType = LHSnode->nodetype;
			Type RHSactualType = RHSnode->nodetype;
			std::string expressionStr = (std::string)syntaxTree->token->tokenstr;

			LHSnode->isUsed = true;
			RHSnode->isUsed = true;

			if (LHSnode->isInitialized == false and syntaxTree->child[0]->kind == IdK){
			printf("WARNING(%d): Variable %s may be uninitialized when used here.\n", lineno, LHSsymbolName.c_str());
			++*numWarnings;
			}
			if (RHSnode->isInitialized == false and syntaxTree->child[1]->kind == IdK){
			printf("WARNING(%d): Variable %s may be uninitialized when used here.\n", lineno, RHSsymbolName.c_str());
			++*numWarnings;
			}


	

			if (LHSactualKind == FunK){
				printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, LHSsymbolName.c_str());
				++*numErrors;

			}
			if (RHSactualKind == FunK){
				printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, RHSsymbolName.c_str());
				++*numErrors;
				break;

			}

			if ((LHSnode->isArray == true or RHSnode->isArray == true) and expressionStr != "==" and expressionStr != "!="){
				printf("ERROR(%d): The operation '%s' does not work with arrays.\n", lineno, syntaxTree->token->tokenstr);
				++*numErrors;
			}



			if (expressionStr == "==" or expressionStr == "<=" or expressionStr == ">=" or expressionStr == ">" or expressionStr == "<" or expressionStr == "!="){


			if (LHSactualType != RHSactualType){

				printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", lineno, syntaxTree->token->tokenstr, typeList[LHSactualType].c_str(), typeList[RHSactualType].c_str());
				++*numErrors;

			}
			break;


			}

			
			if (LHSactualType != syntaxTree->nodetype or RHSactualType != syntaxTree->nodetype){
			if (LHSactualType != syntaxTree->nodetype){
				printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", lineno, syntaxTree->token->tokenstr, typeList[syntaxTree->nodetype].c_str(), typeList[LHSactualType].c_str());
				++*numErrors;
			}

			if (RHSactualType != syntaxTree->nodetype){
				printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", lineno, syntaxTree->token->tokenstr, typeList[syntaxTree->nodetype].c_str(), typeList[LHSactualType].c_str());
				++*numErrors;
			}
			break;
			}

			if (LHSactualType != RHSactualType){

				printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", lineno, syntaxTree->token->tokenstr, typeList[LHSactualType].c_str(), typeList[RHSactualType].c_str());
				++*numErrors;

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
			//printf("ID: %s\n", symbolName.c_str());
			syntaxTree->nodetype = node->nodetype;
			node->isUsed = true;

			/*if (node->isInitialized == false and syntaxTree->nodekind == ExpK){
			printf("WARNING(%d): Variable %s may be uninitialized when used here.\n", lineno, symbolName.c_str());
			++*numWarnings;
			}*/
	
		}

		else{
			printf("ERROR(%d): Symbol '%s' is not declared.\n", syntaxTree->lineno, symbolName.c_str());
			++*numErrors;
		}
		
		
		break;
	     }



	    case UnaryK:{

		Kind childKind = syntaxTree->child[0]->kind;

		int lineno = syntaxTree->lineno;
		std::string childSymbolName;

		TreeNode *childNode;


		if (childKind == FunK){
			printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, syntaxTree->child[0]->token->tokenstr);
			++*numErrors;

		}

		else if (childKind == IdK){
			childSymbolName = (std::string)syntaxTree->child[0]->token->tokenstr;
			childNode = (TreeNode*)st.lookup(childSymbolName);
				
		}
		else{

			if ((std::string)syntaxTree->child[0]->token->tokenstr == "["){
				childSymbolName = (std::string)syntaxTree->child[0]->child[0]->token->tokenstr;
				childNode = (TreeNode*)st.lookup(childSymbolName);
			}
			else{

				childNode = syntaxTree->child[0];
			}
			
		}

		childNode->isUsed = true;

		if ((std::string)syntaxTree->token->tokenstr == "*"){
			if (childNode->isArray == false){
		
				printf("ERROR(%d): The operation '%s' only works with arrays.\n", lineno, syntaxTree->token->tokenstr);
				++*numErrors;
			}
			break;
		}
		else{
	
			if (childNode->isArray == true){

				printf("ERROR(%d): The operation '%s' does not work with arrays.\n", lineno, syntaxTree->token->tokenstr);
				++*numErrors;
				break;
			}
			

		}


		if (childNode->nodetype != syntaxTree->nodetype){


			printf("ERROR(%d): Unary '%s' requires an operand of %s but was given %s.\n", lineno, syntaxTree->token->tokenstr, typeList[syntaxTree->nodetype].c_str(), typeList[childNode->nodetype].c_str());
			++*numErrors;
		}

		
		break;
	}

	    case FunK:{

		std::string symbolName = (std::string)syntaxTree->token->tokenstr;
		int lineno = syntaxTree->lineno;

		/*if (!st.insert(symbolName, syntaxTree)){
			int prevLine = ((TreeNode*)st.lookup(symbolName))->lineno;
			printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", lineno, symbolName.c_str(), prevLine);
			++*numErrors;
		}*/

		if (st.lookup(symbolName) != NULL){

			int prevLine = ((TreeNode*)st.lookup(symbolName))->lineno;
			printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", lineno, symbolName.c_str(), prevLine);
			++*numErrors;

		}
		else{
			st.insert(symbolName, syntaxTree);
		}

		symbolNames->push_back(symbolName);
		st.enter("Function " + (std::string)syntaxTree->token->tokenstr);

	        break;
	    }

	    case ParamK:{

		std::string symbolName = (std::string)syntaxTree->token->tokenstr;
		int lineno = syntaxTree->lineno;

		if (st.lookup(symbolName) != NULL){

			int prevLine = ((TreeNode*)st.lookup(symbolName))->lineno;
			printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", lineno, symbolName.c_str(), prevLine);
			++*numErrors;
			break;
		}
		else{
			st.insert(symbolName, syntaxTree);
		}

		symbolNames->push_back(symbolName);
		symbolStack->push_back(symbolName);

	        break;
	    }


	    case VarK:{

		std::string symbolName = (std::string)syntaxTree->token->tokenstr;
		int lineno = syntaxTree->lineno;

		if (st.lookup(symbolName) != NULL){

			int prevLine = ((TreeNode*)st.lookup(symbolName))->lineno;
			printf("ERROR(%d): Symbol '%s' is already declared at line %d.\n", lineno, symbolName.c_str(), prevLine);
			++*numErrors;
			break;
		}
		else{
			st.insert(symbolName, syntaxTree);
		}

		symbolNames->push_back(symbolName);
		if (!st.isGlobal()) symbolStack->push_back(symbolName);

	        break;
	    }

	    case ConstK:
		
		break;
    }


    scopeAndType(syntaxTree->child[0], numErrors, numWarnings, st, symbolNames, symbolStack);
    scopeAndType(syntaxTree->child[1], numErrors, numWarnings, st, symbolNames, symbolStack);
    scopeAndType(syntaxTree->child[2], numErrors, numWarnings, st, symbolNames, symbolStack);

    switch (syntaxTree->kind)
    {
	    case LoopK:{

		    TreeNode *node;

		   /* for (int i = 0; i < symbolStack->size(); i++){

			std::string symbolName = (*symbolStack)[i];

			if (st.lookup(symbolName)){
			    node = (TreeNode *)st.lookup(symbolName);
			    if (!node->isUsed){
				printf("WARNING(%d): The variable %s seems not to be used.\n", node->lineno, node->token->tokenstr);
				++*numWarnings;
			    }
			}
		    }*/

		//symbolStack->clear();

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

			if (st.isInTopScope(symbolName)){
			if (st.lookup(symbolName)){

			    node = (TreeNode *)st.lookup(symbolName);
			    if (!node->isUsed){
				printf("WARNING(%d): The variable %s seems not to be used.\n", node->lineno, node->token->tokenstr);
				++*numWarnings;
			    }
			}
			}
		    }
		//symbolStack->clear();
	//printf("Leaving %d\n", syntaxTree->lineno);
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
