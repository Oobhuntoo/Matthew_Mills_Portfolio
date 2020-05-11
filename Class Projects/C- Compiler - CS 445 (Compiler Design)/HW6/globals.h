
#ifndef _GLOBALS_H_
#define _GLOBALS_H_

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "scanType.h"
#include <vector>
#include <string>


#define ENDFILE 0

#ifndef FALSE
#define FALSE 0
#endif

#ifndef TRUE
#define TRUE 1
#endif

#define MAXRESERVED 8

typedef int TokenType; 

extern FILE* source; 
extern FILE* listing; 
extern FILE* code; 

/*int linenumber;
int *numErrors;
char *lastToken;*/

//*******************************************************************

// enums of tree nodes
typedef enum { StmtK, ExpK, DeclK } NodeKind;

typedef enum {

	LoopK, WhileK, CompoundK, IfK, 
	ReturnK, BreakK, CallK,
	OpK, AssignK, VarK, FunK, ParamK,
	TypeK, ConstK, IdK, UnaryK, RangeK, LoopForeverK, ElsifK
} Kind;

typedef enum {Int, Void, Char, Bool, String, Undef } Type;

#define MAXCHILDREN 3


struct TreeNode
{
    int lineno;             
    char * svalue; 

    int locNum;
    int memSize;
    bool global;
    bool parameter;
    bool local;
    bool localStatic;
    int prevLoopLoc;
    int preCompoundLoc;

    bool isStatic;         
    bool isArray; 

    bool isUsed;
    bool isInitialized;
    bool hasIssued;

    NodeKind nodekind;  
    Kind kind;          
    Type nodetype;          

    TokenData * token;      
    int arraySize;          
    
    int numChildren;                        
    struct TreeNode *child[MAXCHILDREN]; 
    bool isConstant;   
    struct TreeNode *sibling;               

     
         
    bool isIndex;          
       
};
#endif
