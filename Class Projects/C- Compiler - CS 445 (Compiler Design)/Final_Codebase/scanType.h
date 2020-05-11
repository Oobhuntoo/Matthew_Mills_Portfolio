/* author: Matthew Mills
   course: CS 445 - Compiler Design
   instructor: Dr. Robert Heckendorn
   title: scanType.h
   purpose: Header file that contains the token data struct used in lexical analysis
   date: February 2020
*/

#ifndef _SCANTYPE_H_
#define _SCANTYPE_H_
// 
//  SCANNER TOKENDATA
// 
struct TokenData {
    int tokenclass;   // token class
    int linenum;      // line number where token found
    char *tokenstr;   // literal string for token for use
    int idValue;      // location in array of values of variable
    int numValue;  // value of number if number
    char *strValue; // value of charconst and stringconst
};
#endif
