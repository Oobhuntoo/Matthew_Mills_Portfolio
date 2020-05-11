#ifndef _YYERROR_H_
#define _YYERROR_H_

extern int yylineno;               // line number
extern int syntax_error;          // number of errors

void initErrorProcessing();    // WARNING: must be called before any errors occur (near top of main)!
void yyerror(const char *msg);

#endif

