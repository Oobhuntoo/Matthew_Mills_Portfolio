%{

/* author: Matthew Mills
   course: CS 445 - Compiler Design
   instructor: Dr. Robert Heckendorn
   title: c-.l
   purpose: Flex scanner that performs lexical analysis
   date: February 2020
*/

#include <stdlib.h>
#include <string.h>
// must come before calc.tab.h because it refers to this datatype
#include "scanType.h"   // shared token value struct
#include "globals.h"    // defines a TreeNode
#include "c-.tab.h"     // token defs (needs to know what a TreeNode is)

// extern void yyerror(const char *msg);
//char *lastToken=(char *)"";
static int line=1;

extern int syntax_warning;

static int setValue(int linenum, int tokenClass, char *svalue)
{
    //printf("got to funct %d\n", tokenClass);
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

     case CHARCONST:

	//Handles cases of escaped characters
	if((svalue[1] == '\\' && svalue[3] != '\'') || (svalue[1] != '\\' && svalue[2] != '\'')) { 

		int nchar = 0; /* Find the length number of char , excludes 'spaces' */ 

		for(char *p = svalue; *p; nchar += (*p++ != ' ')); 

		char *temp1 = new char(); 
		temp1[0] = svalue[1];
 
		yylval.tokenData->strValue = strdup(temp1); 

		printf("WARNING(%d): character is %d characters and not a single character: %s. First char used.\n",yylval.tokenData->linenum, nchar, svalue); 

		syntax_warning++; 
		break; 

	}

        if (svalue[1] == '\\'){

                if (svalue[2] == 'n'){
			char *temp = new char('\n');
			yylval.tokenData->strValue = temp;
                }
                else if (svalue[2] == '0'){
			char *temp = new char('\0');
			yylval.tokenData->strValue = temp;
                }
                else{
			char *temp = new char(svalue[2]);
			yylval.tokenData->strValue = temp;
                }

        }

        else{
		char *temp = new char(svalue[1]);
		yylval.tokenData->strValue = temp;
        }
      
        break;


     case STRINGCONST:

	  // Handles cases of strings containing escaped characters
          int input_length = strlen(svalue);

	  char *temp = new char;
	  int temp_len = 0;

	  for (int i = 1; i < input_length - 1; i++){
		if (svalue[i] != '\\'){
			temp[temp_len] = svalue[i];
			temp_len++;
		}
		else{

		
			if (svalue[i + 1] == 'n'){
				temp[temp_len] = '\n';
				i++;
				temp_len++;
			}
			else if (svalue[i + 1] == '0'){
				temp[temp_len] = '\0';
				i++;
				temp_len++;
			}
			else if (svalue[i + 1] == '\\'){
				temp[temp_len] = '\\';
				i++;
				temp_len++;
			}
                        else{
			        temp[temp_len] = svalue[i + 1];
				temp_len++;
				i++;
			}
		
		}
	   }

	   yylval.tokenData->strValue = temp;
	   break;
		
    
    }

    // return token class
    return tokenClass;


//The following list is a comprehensive list of tokens in the C- language definition
}

%}

%option noyywrap
%option yylineno

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
[a-zA-Z_]+[a-zA-Z0-9_]*  { return setValue(line, ID, yytext); }
";"			{ return setValue(line, ';', yytext); }
":"			{ return setValue(line, ':', yytext); }
","			{ return setValue(line, ',', yytext); }
"["			{ return setValue(line, '[', yytext); }
"]"			{ return setValue(line, ']', yytext); }
"("			{ return setValue(line, '(', yytext); }
")"			{ return setValue(line, ')', yytext); }
"{"			{ return setValue(line, '{', yytext); }
"}"			{ return setValue(line, '}', yytext); }
"="			{ return setValue(line, '=', yytext); }
"<"			{ return setValue(line, '<', yytext); }
">"			{ return setValue(line, '>', yytext); }
"+"			{ return setValue(line, '+', yytext); }
"-"			{ return setValue(line, '-', yytext); }
"*"			{ return setValue(line, '*', yytext); }
"/"			{ return setValue(line, '/', yytext); }
"%"			{ return setValue(line, '%', yytext); }
"?"			{ return setValue(line, '?', yytext); }
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
'\\.'                   { return setValue(line, CHARCONST, yytext); }
'[^\n\']'               { return setValue(line, CHARCONST, yytext); }
"\""(\\.|[^\\"\n])*"\""  { return setValue(line, STRINGCONST, yytext); }
[ \t]                   ;  // white space
"//".*                  ;  //comments
\n                      { line++; }
. {printf("WARNING(%d): Invalid or misplaced input character: '%c'. Character Ignored.\n",yylineno, yytext[0]); syntax_warning++;}
%%

