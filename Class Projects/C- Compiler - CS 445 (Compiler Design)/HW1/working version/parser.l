%{
#include <stdlib.h>
// must come before calc.tab.h because it refers to this datatype
#include "scanType.h"     // shared token value struct
#include "parser.tab.h"     // token defs

// extern void yyerror(const char *msg);
//char *lastToken=(char *)"";
static int line=1;

static int setValue(int linenum, int tokenClass, char *svalue)
{
    // create and handle default data storage
    yylval.tokenData = new TokenData;
    yylval.tokenData->tokenclass = tokenClass;
    yylval.tokenData->linenum = linenum;
    yylval.tokenData->tokenstr = strdup(svalue);

    // handle special conversions
    switch (tokenClass) {

    case BOOLCONST:
        //printf("%c", svalue[0]);
        if (svalue[0] == 't'){
            yylval.tokenData->numValue = 1;
        }
        else{
            yylval.tokenData->numValue = 0;
        }

        break;

     case NUMCONST:
        
        yylval.tokenData->numValue = atoi(svalue);

        break;

    /* case CHARCONST:

        if (svalue[1] == '\\'){        
        	yylval.tokenData->charValue = svalue[2];
        }

        else{
        	yylval.tokenData->charValue = svalue[1];
        }

        break;*/
    
    }

    // return token class
    return tokenClass;
}

%}

%option noyywrap

%%
"int"                   { return setValue(line, INT, yytext); }
"bool"                  { return setValue(line, BOOL, yytext); }
"true"                  { return setValue(line, BOOLCONST, yytext); }
"and"                   { return setValue(line, AND, yytext); }
"or"                    { return setValue(line, OR, yytext); }
"not"                   { return setValue(line, NOT, yytext); }
"if"                    { return setValue(line, IF, yytext); }
"then"                  { return setValue(line, THEN, yytext); }
"elsif"                 { return setValue(line, ELSIF, yytext); }
"else"                  { return setValue(line, ELSE, yytext); }
"while"                 { return setValue(line, WHILE, yytext); }
"do"                    { return setValue(line, DO, yytext); }
"break"                 { return setValue(line, BREAK, yytext); }
"loop"                  { return setValue(line, LOOP, yytext); }
".."                    { return setValue(line, RANGE, yytext); }
"forever"               { return setValue(line, FOREVER, yytext); }
"static"                { return setValue(line, STATIC, yytext); }
"return"                { return setValue(line, RETURN, yytext); }
"char"                  { return setValue(line, CHAR, yytext); }
[0-9]+                  { return setValue(line, NUMCONST, yytext); }
"false"                 { return setValue(line, BOOLCONST, yytext); }
[a-zA-Z]+[a-zA-Z0-9_]*  { return setValue(line, ID, yytext); }
"+="                    { return setValue(line, ADDASS, yytext); }
"-="                    { return setValue(line, SUBASS, yytext); }
"/="                    { return setValue(line, DIVASS, yytext); }
"*="                    { return setValue(line, MULASS, yytext); }
"<="                    { return setValue(line, LESSEQ, yytext); }
">="                    { return setValue(line, GRTEQ, yytext); }
"!="                    { return setValue(line, NOTEQ, yytext); }
"=="                    { return setValue(line, EQ, yytext); }
"--"                    { return setValue(line, DEC, yytext); }
"++"                    { return setValue(line, INC, yytext); }                 
'.'                  { return setValue(line, CHARCONST, yytext); }
[ \t]                   ;  // white space
"//".*                  ;  //comments
\n                      { line++; }
.                       { return setValue(line, yytext[0], yytext); }
%%

