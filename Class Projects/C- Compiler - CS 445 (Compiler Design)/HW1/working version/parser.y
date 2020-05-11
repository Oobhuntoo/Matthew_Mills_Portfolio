%{ 
#include <stdio.h>
#include <stdlib.h>
#include "scanType.h"

#ifdef CPLUSPLUS
extern int yylex();
extern FILE* yyin;
#endif

void yyerror(const char *msg)
{
      printf("ERROR(PARSER): %s\n", msg);
}

%}

%union {
    TokenData *tokenData;
    int value;
}

// token specifies the token classes from the scanner
%token <tokenData> INT ID BOOL BOOLCONST NUMCONST ADDASS SUBASS DIVASS MULASS EQ LESSEQ GRTEQ NOTEQ AND OR NOT IF THEN ELSIF ELSE WHILE DO BREAK LOOP RANGE FOREVER STATIC RETURN CHAR DEC INC CHARCONST ';' ',' '[' ']' '(' ')' '{' '}' '=' '<' '>' '+' '-' '*' '/' '%' '?' ':'

// type specifies the token classes used only in the parser
%type <value> statementlist statement
%%

statementlist : statement 
              | statement statementlist
              ;

statement : INT		{ printf("Line: %d Token: INT\n", $1->linenum);  }
          | ID          { printf("Line: %d Token: ID Value: %s\n", $1->linenum, $1->tokenstr);  }
          | BOOL	{ printf("Line: %d Token: BOOL\n", $1->linenum);  }
          | BOOLCONST   { printf("Line: %d Token: BOOLCONST Value: %d Input: %s\n", $1->linenum, $1->numValue, $1->tokenstr); }
          | NUMCONST    { printf("Line: %d Token: NUMCONST Value: %d Input: %s\n", $1->linenum, $1->numValue, $1->tokenstr); }

          | ADDASS      { printf("Line: %d Token: ADDASS\n", $1->linenum);  }
          | SUBASS      { printf("Line: %d Token: SUBASS\n", $1->linenum);  }
          | DIVASS      { printf("Line: %d Token: DIVASS\n", $1->linenum);  }
          | MULASS      { printf("Line: %d Token: MULASS\n", $1->linenum);  }
          | EQ          { printf("Line: %d Token: EQ\n", $1->linenum);  }
          | LESSEQ      { printf("Line: %d Token: LESSEQ\n", $1->linenum);  }
          | GRTEQ       { printf("Line: %d Token: GRTEQ\n", $1->linenum);  }
          | NOTEQ       { printf("Line: %d Token: NOTEQ\n", $1->linenum);  }
          | AND         { printf("Line: %d Token: AND\n", $1->linenum);  }
          | OR          { printf("Line: %d Token: OR\n", $1->linenum);  }
          | NOT         { printf("Line: %d Token: NOT\n", $1->linenum);  }
          | IF          { printf("Line: %d Token: IF\n", $1->linenum);  }
          | THEN        { printf("Line: %d Token: THEN\n", $1->linenum);  }
          | ELSIF       { printf("Line: %d Token: ELSIF\n", $1->linenum);  }
          | ELSE        { printf("Line: %d Token: ELSE\n", $1->linenum);  }
          | WHILE       { printf("Line: %d Token: WHILE\n", $1->linenum);  }
          | DO          { printf("Line: %d Token: DO\n", $1->linenum);  }
          | BREAK       { printf("Line: %d Token: BREAK\n", $1->linenum);  }
          | LOOP        { printf("Line: %d Token: LOOP\n", $1->linenum);  }
          | RANGE       { printf("Line: %d Token: RANGE\n", $1->linenum);  }
          | FOREVER     { printf("Line: %d Token: FOREVER\n", $1->linenum);  }
          | STATIC      { printf("Line: %d Token: STATIC\n", $1->linenum);  }
          | RETURN      { printf("Line: %d Token: RETURN\n", $1->linenum);  }
          | CHAR        { printf("Line: %d Token: CHAR\n", $1->linenum);  }
          | DEC         { printf("Line: %d Token: DEC\n", $1->linenum);  }
          | INC         { printf("Line: %d Token: INC\n", $1->linenum);  }
          | CHARCONST   { printf("Line: %d Token: CHARCONST Value: %s Input: %s\n", $1->linenum, $1->tokenstr, $1->tokenstr); }
          | ';'         { printf("Line: %d Token: ;\n", $1->linenum);  }

          | ','         { printf("Line: %d Token: ,\n", $1->linenum);  }

          | '['         { printf("Line: %d Token: [\n", $1->linenum);  }

          | ']'         { printf("Line: %d Token: ]\n", $1->linenum);  }

          | '('         { printf("Line: %d Token: (\n", $1->linenum);  }

          | ')'         { printf("Line: %d Token: )\n", $1->linenum);  }

          | '{'         { printf("Line: %d Token: {\n", $1->linenum);  }

          | '}'         { printf("Line: %d Token: }\n", $1->linenum);  }

          | '='         { printf("Line: %d Token: =\n", $1->linenum);  }

          | '<'         { printf("Line: %d Token: <\n", $1->linenum);  }

          | '>'         { printf("Line: %d Token: >\n", $1->linenum);  }

          | '+'         { printf("Line: %d Token: +\n", $1->linenum);  }

          | '-'         { printf("Line: %d Token: -\n", $1->linenum);  }

          | '*'         { printf("Line: %d Token: *\n", $1->linenum);  }

          | '/'         { printf("Line: %d Token: /\n", $1->linenum);  }

          | '%'         { printf("Line: %d Token: %%\n", $1->linenum);  }

          | '?'         { printf("Line: %d Token: ?\n", $1->linenum);  }

          | ':'         { printf("Line: %d Token: :\n", $1->linenum);  }








          ;



%%

int main(int argc, char* argv[])
{
//        yydebug=1;

        if (argc > 1){


            if ((yyin = fopen(argv[1], "r"))){

                 yyparse();
                 return 0;

            }

            else{
                printf("Error opening file\n");
                return(-1);
            }

        }

        else{

		yyparse();   // call the parser

		return 0;
        }
}

