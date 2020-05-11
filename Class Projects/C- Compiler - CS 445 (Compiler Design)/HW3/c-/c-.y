%{ 
#include <stdio.h>
#include <stdlib.h>
#include "scanType.h"
#include "globals.h"
#include "util.h"
#include <string>
#include <vector>
#include <iostream>
#include "ourgetopt.h"
#include "printTree.h"
#include "semantic.h"

using namespace std;

TreeNode *savedTree; /* stores syntax tree for later return */

#ifdef CPLUSPLUS
extern int yylex();
extern FILE* yyin;
#endif

void yyerror(const char *msg)
{
      printf("ERROR(PARSER): %s\n", msg);
}

void printTree(TreeNode *tree, int childnum, int siblingnum, bool calledAsChild, bool calledAsSibling, string formatStr);



%}

%union {
    TreeNode *treeNode;
    TokenData *tokenData;
}

// token specifies the token classes from the scanner
%token <tokenData> INT ID BOOL BOOLCONST NUMCONST ADDASS SUBASS DIVASS MULASS EQ LESSEQ GRTEQ NOTEQ AND OR NOT IF THEN ELSIF ELSE WHILE DO BREAK LOOP RANGE FOREVER STATIC RETURN CHAR DEC INC CHARCONST STRINGCONST UNDEFINED ';' ',' '[' ']' '(' ')' '{' '}' '=' '<' '>' '+' '-' '*' '/' '%' '?' ':'

// type specifies the token classes used only in the parser
%type <treeNode> program declarationList declaration varDeclaration varDeclList varDeclInitialize varDeclId simpleExpression andExpression unaryRelExpression relExpression sumExpression mulExpression unaryExpression factor immutable constant typeSpecifier scopedTypeSpecifier scopedVarDeclaration paramId paramIdList paramTypeList paramList params funDeclaration argList args call expression relop mulop unaryop mutable sumop statement matched expressionStmt compoundStmt localDeclarations statementList matchedSelStmt unmatched unmatchedSelStmt iterationRange matchedWhileStmt unmatchedWhileStmt matchedLoopStmt unmatchedLoopStmt matchedElsif unmatchedElsif returnStmt breakStmt
%%

//List of things that may cause problems:
// 1. put semicolon after program -> declarationList to allow parsing of single line programs
// 2. added scopedVarDeclaration { $$ = $1; } to declaration to allow parsing of static vars before statemnt defined
// 3. replaced statement with CONST in production for funDeclaration to allow for parsing of functions before grammar for statement was defined
// 4. Id's come off of declarations
// 5. expressions in declInitialize



program    : declarationList  { savedTree = $1;}
	   ;


declarationList    : declarationList declaration
			{ TreeNode *t = $1;
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = $2;
                               $$ = $1;
                           }
                           else { $$ = $2;}
		         }
		   | declaration { $$ = $1; }
		   ;


declaration    : varDeclaration { $$ = $1; }
	       | funDeclaration { $$ = $1; }
	       ;

varDeclaration    : typeSpecifier varDeclList ';'
		    {
			TreeNode *t = $2;
			
			while( t != NULL) {
				t->nodetype = $1->nodetype;
				t = t->sibling;
        		}
			$$ = $2;

		    }
		  ;


scopedVarDeclaration    : scopedTypeSpecifier varDeclList ';'
		          {
			   $$ = $2;
			   if ($1->isStatic) $$->isStatic = true;
			   TreeNode *t = $2;
			   while( t != NULL) {
				t->nodetype = $1->nodetype;
				t->isStatic = true;
				t = t->sibling;
        		   }
		          }
		        ;



varDeclList    : varDeclList ',' varDeclInitialize
			{ TreeNode *t = $1;
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = $3;
                               $$ = $1;
                           }
                           else { $$ = $3;}
		         }
		  | varDeclInitialize { $$ = $1; }
		  ;

varDeclInitialize    : varDeclId
		     | varDeclId ':' simpleExpression
			 { 
			   $1->child[0] = $3;
			   $$ = $1;
		         }
		     ;


varDeclId    : ID 
		{
		 $$ = newNode(DeclK, VarK, Void, $1->linenum, $1); 
    		
		}

	     | ID '[' NUMCONST ']'
		{
		 $$ = newNode(DeclK, VarK, Void, $1->linenum, $1);
		 $$->isArray = true;
		 $$->arraySize = $3->numValue;
		}
	     ;

scopedTypeSpecifier    : STATIC typeSpecifier { $2->isStatic = true; $$ = $2; }
		       | typeSpecifier { $$ = $1; }
		       ;


typeSpecifier    : INT {  $$ = newNode(DeclK, TypeK, Int, $1->linenum, $1); }
		 | BOOL { $$ = newNode(DeclK, TypeK, Bool, $1->linenum, $1); }
		 | CHAR { $$ = newNode(DeclK, TypeK, Char, $1->linenum, $1); }
		 ;

funDeclaration    : typeSpecifier ID '(' params ')' statement
		    { $$ = newNode(DeclK, FunK, $1->nodetype, $2->linenum, $2);
		      $$->child[0] = $4;
		      $$->child[1] = $6;
		    }
		  | ID '(' params ')' statement
		    { $$ = newNode(DeclK, FunK, Void, $1->linenum, $1);
		      $$->child[0] = $3;
		      $$->child[1] = $5;
		    }
		  ;

params    : paramList 
	  | { $$ = NULL; }
	  ;

paramList    : paramList ';' paramTypeList
			{ TreeNode *t = $1;
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = $3;
                               $$ = $1;
                           }
                           else { $$ = $3;}
		         }
	     | paramTypeList { $$ = $1; }
	     ;

paramTypeList    : typeSpecifier paramIdList 
		    {
			TreeNode *t = $2;
			
			while( t != NULL) {
				t->nodetype = $1->nodetype;
				t = t->sibling;
        		}
			$$ = $2;
		    }
		  ;

paramIdList    : paramIdList ',' paramId
			{ TreeNode *t = $1;
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = $3;
                               $$ = $1;
                           }
                           else { $$ = $3;}
		         }
	       | paramId { $$ = $1; }
	       ;

paramId    : ID { $$ = newNode(DeclK, ParamK, Void, $1->linenum, $1); }
	   | ID '[' ']' { $$ = newNode(DeclK, ParamK, Void, $1->linenum, $1); $$->isArray = true; }
	   ;


statement    : matched { $$ = $1; } | unmatched { $$ = $1; }
	     ;

matched    : expressionStmt { $$ = $1; }
	   | compoundStmt { $$ = $1; }
	   | matchedSelStmt { $$ = $1; }
	   | matchedWhileStmt { $$ = $1; }
	   | matchedLoopStmt { $$ = $1; }
	   | returnStmt { $$ = $1; }
	   | breakStmt { $$ = $1; }
	   ;

unmatched    : unmatchedSelStmt { $$ = $1; }
	     | unmatchedWhileStmt { $$ = $1; }
	     | unmatchedLoopStmt { $$ = $1; }
	     
	     ;

compoundStmt    : '{' localDeclarations statementList '}'
			{ $$ = newNode(StmtK, CompoundK, Void, $1->linenum, $1);
			  $$->child[0] = $2;
			  $$->child[1] = $3;
			}
		;

matchedSelStmt    : IF simpleExpression THEN matched matchedElsif
			{
			 $$ = newNode(StmtK, IfK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			 $$->child[2] = $5;
			}
		   ;

matchedElsif    : ELSIF simpleExpression THEN matched matchedElsif
			{
			 $$ = newNode(StmtK, ElsifK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			 $$->child[2] = $5;
			}			
			
		 | ELSE matched { $$ = $2; }
		 ;

unmatchedSelStmt    : IF simpleExpression THEN unmatched
			{ 
			 $$ = newNode(StmtK, IfK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			}
		    | IF simpleExpression THEN matched
			{ 
			 $$ = newNode(StmtK, IfK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			}

		    | IF simpleExpression THEN matched unmatchedElsif
			{
			 $$ = newNode(StmtK, IfK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			 $$->child[2] = $5;
			}
		     ;

unmatchedElsif    : ELSIF simpleExpression THEN matched unmatchedElsif
			{
			 $$ = newNode(StmtK, ElsifK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			 $$->child[2] = $5;
			} 
		  | ELSIF simpleExpression THEN matched
			{
			 $$ = newNode(StmtK, ElsifK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			} 
		  | ELSIF simpleExpression THEN unmatched
			{
			 $$ = newNode(StmtK, ElsifK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			} 
		  | ELSE unmatched { $$ = $2; }
		  ;	
			 

matchedWhileStmt    : WHILE simpleExpression DO matched
			{
			 $$ = newNode(StmtK, WhileK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			}
		    ;

unmatchedWhileStmt    : WHILE simpleExpression DO unmatched
			{
			 $$ = newNode(StmtK, WhileK, Void, $1->linenum, $1);
			 $$->child[0] = $2;
			 $$->child[1] = $4;
			}
		      ;

matchedLoopStmt    : LOOP ID '=' iterationRange DO matched
			{
			 $$ = newNode(StmtK, LoopK, Void, $1->linenum, $1);
			 TreeNode *idNode = newNode(ExpK, IdK, Int, $2->linenum, $2);
			 $$->child[0] = idNode;
			 $$->child[1] = $4;
			 $$->child[2] = $6;
			}
		   | LOOP FOREVER matched
			{
			 $$ = newNode(StmtK, LoopForeverK, Void, $1->linenum, $1);
			 $$->child[1] = $3;
			}
		      ;

unmatchedLoopStmt    : LOOP ID '=' iterationRange DO unmatched
			{
			 $$ = newNode(StmtK, LoopK, Void, $1->linenum, $1);
			 TreeNode *idNode = newNode(ExpK, IdK, Void, $2->linenum, $2);
			 $$->child[0] = idNode;
			 $$->child[1] = $4;
			 $$->child[2] = $6;
			}
		   | LOOP FOREVER unmatched
			{
			 $$ = newNode(StmtK, LoopForeverK, Void, $1->linenum, $1);
			 $$->child[1] = $3;
			}
		      ;

returnStmt    : RETURN ';' 
		{
		 $$ = newNode(StmtK, ReturnK, Void, $1->linenum, $1);
		}
	      | RETURN expression ';'
		{
		 $$ = newNode(StmtK, ReturnK, Void, $1->linenum, $1);
		 $$->child[0] = $2;
		}
	      ;

breakStmt    : BREAK ';' { $$ = newNode(StmtK, BreakK, Void, $1->linenum, $1); }
	      ;

localDeclarations    : localDeclarations scopedVarDeclaration
			{ TreeNode *t = $1;
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = $2;
                               $$ = $1;
                           }
                           else { $$ = $2;}
		         }
		     |  { $$ = NULL; }
		     
		      ;



iterationRange    : simpleExpression RANGE simpleExpression
		    {
			$$ = newNode(ExpK, RangeK, Void, $2->linenum, $2);
			$$->child[0] = $1;
			$$->child[1] = $3;

			TokenData *newToken = new TokenData;
			newToken->tokenstr = new char('1');
			newToken->numValue = 1;
			newToken->linenum = $2->linenum;

			$$->child[2] = newNode(ExpK, ConstK, Int, $2->linenum, newToken);

			
		    }
		   | simpleExpression RANGE simpleExpression ':' simpleExpression
		    { 
			$$ = newNode(ExpK, RangeK, Void, $2->linenum, $2);
			$$->child[0] = $1;
			$$->child[1] = $3;
			$$->child[2] = $5;
		    }

		   ;

statementList    : statementList statement
			{ TreeNode *t = $1;
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = $2;
                               $$ = $1;
                           }
                           else { $$ = $2;}
		         }
		| { $$ = NULL; }
		     
		      ;


expressionStmt    : expression ';' { $$ = $1; }
		  | ';' { $$ = NULL; }
		  ;

expression    : mutable '=' expression 
		{ $$ = newNode(ExpK, AssignK, Undef, $2->linenum, $2); 
		  $$->child[0] = $1;
		  $$->child[1] = $3;
		}

	      | mutable INC
		{ $$ = newNode(ExpK, AssignK, Int, $2->linenum, $2); 
		  $$->child[0] = $1;
		}
	      | mutable DEC
		{ $$ = newNode(ExpK, AssignK, Int, $2->linenum, $2); 
		  $$->child[0] = $1;
		}
	      |	mutable ADDASS expression 
		{ $$ = newNode(ExpK, AssignK, Int, $2->linenum, $2); 
		  $$->child[0] = $1;
		  $$->child[1] = $3;
		}
	      |	mutable SUBASS expression 
		{ $$ = newNode(ExpK, AssignK, Int, $2->linenum, $2); 
		  $$->child[0] = $1;
		  $$->child[1] = $3;
		}
	      |	mutable MULASS expression 
		{ $$ = newNode(ExpK, AssignK, Int, $2->linenum, $2); 
		  $$->child[0] = $1;
		  $$->child[1] = $3;
		}
	      |	mutable DIVASS expression 
		{ $$ = newNode(ExpK, AssignK, Int, $2->linenum, $2); 
		  $$->child[0] = $1;
		  $$->child[1] = $3;
		}
	      | simpleExpression { $$ = $1; }
	      ;

simpleExpression    : simpleExpression OR andExpression
			{
			 $$ = newNode(ExpK, OpK, Bool, $2->linenum, $2);
			 $$->child[0] = $1;
			 $$->child[1] = $3;
			 if ($1 != NULL && $3 != NULL && $1->isConstant && $1->isConstant)
				$$->isConstant = true;
			}

		    | andExpression { $$ = $1; }
       		    ;


andExpression    : andExpression AND unaryRelExpression
			{
			 $$ = newNode(ExpK, OpK, Bool, $2->linenum, $2);
			 $$->child[0] = $1;
			 $$->child[1] = $3;
			 if ($1 != NULL && $3 != NULL && $1->isConstant && $1->isConstant)
				$$->isConstant = true;
			}
		 | unaryRelExpression { $$ = $1; }
       		 ;

unaryRelExpression    : NOT unaryRelExpression 
			{
			 $$ = newNode(ExpK, UnaryK, Bool, $1->linenum, $1);
			 $$->child[0] = $2;
			
			 if ($2 != NULL && $2->isConstant) $$->isConstant = true;
			 else $$->isConstant = false;
			}

		      | relExpression { $$ = $1; }
       		      ;

relExpression    : sumExpression relop sumExpression
			{
			 $$ = $2;
			 $$->child[0] = $1;
			 $$->child[1] = $3;
			 if ($1 != NULL && $3 != NULL && $1->isConstant && $1->isConstant)
				$$->isConstant = true;
			}
		 | sumExpression { $$ = $1; }
       		 ;

relop    : LESSEQ { $$ = newNode(ExpK, OpK, Bool, $1->linenum, $1) ; }
	 | '<' { $$ = newNode(ExpK, OpK, Bool, $1->linenum, $1) ; }
	 | '>' { $$ = newNode(ExpK, OpK, Bool, $1->linenum, $1) ; }
	 | GRTEQ { $$ = newNode(ExpK, OpK, Bool, $1->linenum, $1) ; }
	 | EQ { $$ = newNode(ExpK, OpK, Bool, $1->linenum, $1) ; }
	 | NOTEQ { $$ = newNode(ExpK, OpK, Bool, $1->linenum, $1) ; }
	 ;

sumExpression    : sumExpression sumop mulExpression
			{
			 $$ = $2;
			 $$->child[0] = $1;
			 $$->child[1] = $3;
			 if ($1 != NULL && $3 != NULL && $1->isConstant && $1->isConstant)
				$$->isConstant = true;
			}	

		 | mulExpression { $$ = $1; }
       		 ;

sumop    : '+' { $$ = newNode(ExpK, OpK, Int, $1->linenum, $1); }
	 | '-' { $$ = newNode(ExpK, OpK, Int, $1->linenum, $1); }
	 ;

mulExpression    : mulExpression mulop unaryExpression
			{
			 $$ = $2;
			 $$->child[0] = $1;
			 $$->child[1] = $3;
			 if ($1 != NULL && $3 != NULL && $1->isConstant && $1->isConstant)
				$$->isConstant = true;
			}

		 | unaryExpression { $$ = $1; }
       		 ;

mulop    : '/' { $$ = newNode(ExpK, OpK, Int, $1->linenum, $1); }
	 | '*' { $$ = newNode(ExpK, OpK, Int, $1->linenum, $1); }
	 | '%' { $$ = newNode(ExpK, OpK, Int, $1->linenum, $1); }
	 ;


unaryExpression    : unaryop unaryExpression
			{
			 $$ = $1;
			 for (int i = 0; i <= 2; i++)
				if ($$->child[i] == NULL){ $$->child[i] = $2; break; }
			
			 if ($2 != NULL && $2->isConstant) $$->isConstant = true;
			 else $$->isConstant = false;
		
			}
		   | factor { $$ = $1; }
		   ; 

unaryop    : '-' { $$ = newNode(ExpK, UnaryK, Int, $1->linenum, $1); }
	   | '*' { $$ = newNode(ExpK, UnaryK, Int, $1->linenum, $1); }
	   | '?' { $$ = newNode(ExpK, UnaryK, Int, $1->linenum, $1); }
	   ;


factor    : mutable { $$ = $1; } | immutable { $$ = $1; }
	  ;

mutable    : ID { $$ = newNode(ExpK, IdK, Void, $1->linenum, $1); }
	   | mutable '[' expression ']' 
		{
		 $$ = newNode(ExpK, OpK, Undef, $2->linenum, $2);
		 $$->child[0] = $1;

		 $3->isIndex = true;
		 $$->child[1] = $3;
		}
	   ;

immutable    : '(' expression ')' { $$ = $2; }
	     | call { $$ = $1; }
	     | constant { $$ = $1; }
	     ;


call    : ID '(' args ')'
		{
		 if ($3 != NULL){
			$$ = newNode(ExpK, CallK, $3->nodetype, $1->linenum, $1);
			$$->child[0] = $3;
		 }
		 else{
			$$ = newNode(ExpK, CallK, Void, $1->linenum, $1);
		 }
		}
	;


args    : argList { $$ = $1; }
	| { $$ = NULL; }
	;


argList    : argList ',' expression
		{ TreeNode *t = $1;
	           if (t != NULL) {
                       while (t->sibling != NULL){ t = t->sibling; }
                       t->sibling = $3;
                       $$ = $1;
                   }
                   else { $$ = $3;}
	         }
	    | expression { $$ = $1; }
	    ;
		 


constant    : NUMCONST
                 { $$ = newNode(ExpK, ConstK, Int, $1->linenum, $1);
                   $$->isConstant = true;
                 }
	  | BOOLCONST
		{ $$ = newNode(ExpK, ConstK, Bool, $1->linenum, $1);
		  $$->isConstant = true;
		}
	  | CHARCONST
		{ $$ = newNode(ExpK, ConstK, Char, $1->linenum, $1);
		  $$->isConstant = true;
		}
	  | STRINGCONST
		{ $$ = newNode(ExpK, ConstK, Char, $1->linenum, $1);
		  $$->isConstant = true;
		  $$->isArray = true;
		}
	  ;


%%

int main(int argc, char* argv[])
{
	int c;
	extern char *optarg;
	extern int optind;
	int pflg = 0;
	int dflg = 0;
	bool printFlag = false;
        bool printTypes = false;
	int optCount = 1;

	int *numErrors = new int();
	int *numWarnings = new int();
	
	*numErrors = 0;
	*numWarnings = 0;

	std::vector<std::string> *symbolNames = new std::vector<std::string>;
	std::vector<std::string> *symbolStack = new std::vector<std::string>;

	while ((c = ourGetopt(argc, argv, (char *)"pdP:")) != EOF){
	   switch (c) {
	   case	'p':
	       printFlag = true;
	       break;

	   case	'd':
	        yydebug=1;
		break;

	   case	'P':
	        printTypes = true;
		break;
	    }

	    optCount++;
	}

        if (argc > 1){
            if ((yyin = fopen(argv[optCount], "r"))){
		yyparse();   // call the parse
		if (printFlag) printTree(savedTree, 0, -1, false, false, "", false);
		SymbolTable st = SymbolTable();
		scopeAndType(savedTree, numErrors, numWarnings, st, symbolNames, symbolStack);

		checkUseSymbolTable(st, symbolNames, numErrors, numWarnings);
			

		if (printTypes){
			 printTree(savedTree, 0, -1, false, false, "", true);
		}
            }

            else{
                yyin = stdin;
		yyparse();   // call the parse
		if (printFlag) printTree(savedTree, 0, -1, false, false, "", false);
		SymbolTable st = SymbolTable();
		scopeAndType(savedTree, numErrors, numWarnings, st, symbolNames, symbolStack);

		checkUseSymbolTable(st, symbolNames, numErrors, numWarnings);

		if (printTypes){
			 printTree(savedTree, 0, -1, false, false, "", true);

		}

            }
	    printf("Number of warnings: %d\n", *numWarnings);
	    printf("Number of errors: %d\n", *numErrors);


        }

	return 0;
}

