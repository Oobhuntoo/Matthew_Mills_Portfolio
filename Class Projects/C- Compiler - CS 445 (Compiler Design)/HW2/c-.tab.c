/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "c-.y" /* yacc.c:339  */
 
#include <stdio.h>
#include <stdlib.h>
#include "scanType.h"
#include "globals.h"
#include "util.h"
#include <string>
#include <iostream>
#include "ourgetopt.h"

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

void printTree(TreeNode *tree, int childnum, int siblingnum, bool calledAsChild, bool calledAsSibling, string formatStr){

    if (!tree)
	return;




    string printVal = "";

    if (calledAsChild){ formatStr += "!   "; printVal += (formatStr + "Child: " + to_string(childnum) + " "); }
	
    if (calledAsSibling) printVal += (formatStr + "Sibling: " + to_string(siblingnum) + " " );




    switch (tree->kind)
    {
	    case BreakK:

		printVal += ("Break [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case ReturnK:

		printVal += ("Return [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case ElsifK:

		printVal += ("Elsif [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case LoopK:

		printVal += ("Loop [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case LoopForeverK:

		printVal += ("LoopForever [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case WhileK:

		printVal += ("While [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case RangeK:

		printVal += ("Range [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case IfK:

		printVal += ("If [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;
	    case CompoundK:

		printVal += ("Compound [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case AssignK:

		printVal += ("Assign: " + string(tree->token->tokenstr) + " [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case OpK:

		printVal += ("Op: " + string(tree->token->tokenstr) + " [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case CallK:

		printVal += ("Call: " + string(tree->token->tokenstr) + " [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case IdK:

		printVal += ("Id: " + string(tree->token->tokenstr) + " [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;


	    case UnaryK:

		printVal += ("Op: " + string(tree->token->tokenstr) + " [line: " + to_string(tree->token->linenum) + "]");
		cout << printVal << endl;
		break;

	    case FunK:

		printVal += ("Func " + string(tree->token->tokenstr) + " returns type ");

		switch (tree->nodetype)
    		{
		    case Int:
                        printVal += ("int [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;

		    case Bool:
			printVal += ("bool [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;
			
		    case Char:
			printVal += ("char [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;

		    case Void:
			printVal += ("void [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;
    		}


	    break;

	    case ParamK:

		printVal += ("Param " + string(tree->token->tokenstr) + " ");
		if (tree->isArray) printVal += "is array ";

		switch (tree->nodetype)
    		{
		    case Int:
                        printVal += ("of type int [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;

		    case Bool:
			printVal += ("of type bool [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;
			
		    case Char:
			printVal += ("of type char [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;
    		}

		break;


	    case VarK:

		printVal += ("Var " + string(tree->token->tokenstr) + " ");
		if (tree->isArray) printVal += "is array ";

		switch (tree->nodetype)
    		{
		    case Int:
                        printVal += ("of type int [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;

		    case Bool:
			printVal += ("of type bool [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;
			
		    case Char:
			printVal += ("of type char [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			
			break;
    		}

		break;
		

	    case ConstK:

		switch (tree->nodetype)
    		{
			
		    case Int:
			printVal += ("Const: " + to_string(tree->token->numValue) + " [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			break;

		    case Bool:
			printVal += ("Const: " + string(tree->token->tokenstr) + " [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			break;

		    case Char:

			if (tree->isArray){
			printVal += ("Const: " + string("\"") + string(tree->token->strValue) + string("\"") + " [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			}
			else{
			string subPrint = string(tree->token->strValue);
			printVal += ("Const: " + string("'") + subPrint + string("'") + " [line: " + to_string(tree->token->linenum) + "]");
			cout << printVal << endl;
			}

			break;
    		}
		
		break;
    }

    printTree(tree->child[0], 0, -1, true, false, formatStr);
    printTree(tree->child[1], 1, -1, true, false, formatStr);
    printTree(tree->child[2], 2, -1, true, false, formatStr);

    siblingnum++;
    printTree(tree->sibling, 0, siblingnum, false, true, formatStr);
}


#line 329 "c-.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "c-.tab.h".  */
#ifndef YY_YY_C_TAB_H_INCLUDED
# define YY_YY_C_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INT = 258,
    ID = 259,
    BOOL = 260,
    BOOLCONST = 261,
    NUMCONST = 262,
    ADDASS = 263,
    SUBASS = 264,
    DIVASS = 265,
    MULASS = 266,
    EQ = 267,
    LESSEQ = 268,
    GRTEQ = 269,
    NOTEQ = 270,
    AND = 271,
    OR = 272,
    NOT = 273,
    IF = 274,
    THEN = 275,
    ELSIF = 276,
    ELSE = 277,
    WHILE = 278,
    DO = 279,
    BREAK = 280,
    LOOP = 281,
    RANGE = 282,
    FOREVER = 283,
    STATIC = 284,
    RETURN = 285,
    CHAR = 286,
    DEC = 287,
    INC = 288,
    CHARCONST = 289,
    STRINGCONST = 290,
    UNDEFINED = 291
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 264 "c-.y" /* yacc.c:355  */

    TreeNode *treeNode;
    TokenData *tokenData;

#line 411 "c-.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_C_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 428 "c-.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  12
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   238

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  55
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  54
/* YYNRULES -- Number of rules.  */
#define YYNRULES  122
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  187

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   291

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,    52,     2,     2,
      41,    42,    50,    48,    38,    49,     2,    51,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    54,    37,
      46,    45,    47,    53,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    39,     2,    40,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    43,     2,    44,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   285,   285,   289,   298,   302,   303,   306,   320,   335,
     344,   347,   348,   356,   362,   370,   371,   375,   376,   377,
     380,   385,   392,   393,   396,   405,   408,   420,   429,   432,
     433,   437,   437,   440,   441,   442,   443,   444,   445,   446,
     449,   450,   451,   455,   462,   471,   479,   482,   488,   495,
     504,   511,   517,   523,   527,   535,   543,   551,   558,   566,
     573,   577,   584,   587,   596,   602,   617,   627,   636,   641,
     642,   645,   651,   655,   659,   664,   669,   674,   679,   682,
     691,   695,   703,   706,   715,   718,   726,   729,   730,   731,
     732,   733,   734,   737,   746,   749,   750,   753,   762,   765,
     766,   767,   771,   781,   784,   785,   786,   790,   790,   793,
     794,   804,   805,   806,   810,   823,   824,   828,   837,   842,
     846,   850,   854
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "INT", "ID", "BOOL", "BOOLCONST",
  "NUMCONST", "ADDASS", "SUBASS", "DIVASS", "MULASS", "EQ", "LESSEQ",
  "GRTEQ", "NOTEQ", "AND", "OR", "NOT", "IF", "THEN", "ELSIF", "ELSE",
  "WHILE", "DO", "BREAK", "LOOP", "RANGE", "FOREVER", "STATIC", "RETURN",
  "CHAR", "DEC", "INC", "CHARCONST", "STRINGCONST", "UNDEFINED", "';'",
  "','", "'['", "']'", "'('", "')'", "'{'", "'}'", "'='", "'<'", "'>'",
  "'+'", "'-'", "'*'", "'/'", "'%'", "'?'", "':'", "$accept", "program",
  "declarationList", "declaration", "varDeclaration",
  "scopedVarDeclaration", "varDeclList", "varDeclInitialize", "varDeclId",
  "scopedTypeSpecifier", "typeSpecifier", "funDeclaration", "params",
  "paramList", "paramTypeList", "paramIdList", "paramId", "statement",
  "matched", "unmatched", "compoundStmt", "matchedSelStmt", "matchedElsif",
  "unmatchedSelStmt", "unmatchedElsif", "matchedWhileStmt",
  "unmatchedWhileStmt", "matchedLoopStmt", "unmatchedLoopStmt",
  "returnStmt", "breakStmt", "localDeclarations", "iterationRange",
  "statementList", "expressionStmt", "expression", "simpleExpression",
  "andExpression", "unaryRelExpression", "relExpression", "relop",
  "sumExpression", "sumop", "mulExpression", "mulop", "unaryExpression",
  "unaryop", "factor", "mutable", "immutable", "call", "args", "argList",
  "constant", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,    59,    44,    91,
      93,    40,    41,   123,   125,    61,    60,    62,    43,    45,
      42,    47,    37,    63,    58
};
# endif

#define YYPACT_NINF -109

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-109)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      13,  -109,    21,  -109,  -109,    66,    13,  -109,  -109,    72,
    -109,    91,  -109,  -109,   -20,     3,  -109,    19,    74,    39,
      54,  -109,    88,    91,  -109,   104,   181,    71,    76,  -109,
     143,    91,    79,    95,    99,  -109,   101,  -109,  -109,   181,
    -109,  -109,   181,  -109,  -109,  -109,   128,   124,  -109,  -109,
      85,    51,  -109,    18,  -109,   112,  -109,  -109,  -109,   113,
      74,   181,   181,   119,     5,     8,  -109,  -109,  -109,  -109,
    -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,
    -109,   121,   128,   193,  -109,  -109,   143,   181,  -109,   117,
     181,   181,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,
      18,    18,  -109,  -109,  -109,    18,  -109,   181,  -109,  -109,
      14,    15,  -109,   115,   143,  -109,   126,   123,  -109,   181,
     181,   181,   181,  -109,  -109,   181,  -109,  -109,   122,   127,
    -109,   124,  -109,    38,    51,  -109,   130,   143,   143,   181,
    -109,  -109,  -109,    91,  -109,   104,  -109,    86,  -109,  -109,
    -109,  -109,  -109,  -109,   181,  -109,   103,  -109,  -109,  -109,
     147,    -7,  -109,    69,  -109,  -109,  -109,   181,   143,  -109,
    -109,   143,   181,  -109,    34,  -109,  -109,  -109,  -109,    -6,
     143,   181,   103,  -109,   128,  -109,  -109
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,    17,     0,    18,    19,     0,     2,     4,     5,     0,
       6,    23,     1,     3,    13,     0,    10,    11,     0,     0,
      22,    25,     0,    23,     7,     0,     0,    29,    26,    28,
       0,     0,     0,     0,    13,     9,   109,   120,   119,     0,
     121,   122,     0,   104,   105,   106,    12,    80,    82,    84,
      86,    94,    98,     0,   103,   107,   108,   112,   113,     0,
       0,     0,     0,     0,     0,     0,    70,    64,    21,    31,
      32,    34,    35,    40,    36,    41,    37,    42,    38,    39,
      33,     0,    78,   107,    24,    14,     0,   116,    83,     0,
       0,     0,    91,    87,    90,    92,    88,    89,    95,    96,
       0,     0,   100,    99,   101,     0,   102,     0,    30,    27,
       0,     0,    62,     0,     0,    60,     0,    68,    69,     0,
       0,     0,     0,    73,    72,     0,    20,   118,     0,   115,
     111,    79,    81,    85,    93,    97,     0,     0,     0,     0,
      57,    59,    61,     0,    63,     0,    16,     0,    74,    75,
      77,    76,    71,   114,     0,   110,    48,    47,    54,    55,
       0,     0,    15,     0,    43,    67,   117,     0,     0,    44,
      49,     0,     0,     8,     0,    46,    53,    56,    58,    65,
       0,     0,    51,    52,    66,    45,    50
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -109,  -109,  -109,   161,  -109,  -109,    27,   149,  -109,  -109,
       1,  -109,   152,  -109,   145,  -109,   129,   -78,  -108,   -91,
    -109,  -109,    -3,  -109,    -1,  -109,  -109,  -109,  -109,  -109,
    -109,  -109,  -109,  -109,  -109,   -37,   -24,    92,   -36,  -109,
    -109,    83,  -109,    89,  -109,   -49,  -109,  -109,   -26,  -109,
    -109,  -109,  -109,  -109
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     5,     6,     7,     8,   144,    15,    16,    17,   145,
      18,    10,    19,    20,    21,    28,    29,    68,    69,    70,
      71,    72,   169,    73,   170,    74,    75,    76,    77,    78,
      79,   117,   160,   147,    80,    81,    82,    47,    48,    49,
     100,    50,   101,    51,   105,    52,    53,    54,    83,    56,
      57,   128,   129,    58
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      55,     9,    46,    88,   106,    89,   140,     9,   126,   113,
      90,    90,    36,    55,    37,    38,     1,     2,     3,    22,
     172,    23,    36,   141,    37,    38,    39,    55,   116,   156,
     158,    90,    90,   114,   137,    55,    55,   110,   111,   138,
      24,    25,    40,    41,     4,   115,   157,   159,   181,    42,
     127,    90,    40,    41,   180,   132,   135,    43,    44,    42,
     175,    45,    11,   177,    55,    55,    12,    43,    44,   165,
     136,    45,   182,    26,    55,    55,    14,   176,    27,    55,
     178,    30,   148,   149,   150,   151,    98,    99,   152,   183,
      36,    31,    37,    38,     1,    32,     3,    92,    93,    94,
      95,   102,   103,   104,    39,    61,   173,    25,    34,    62,
      59,    63,    64,    55,    60,   161,    65,   166,   146,    85,
      40,    41,     4,    66,   167,   168,     1,    42,     3,    67,
     164,    96,    97,    98,    99,    43,    44,    86,    22,    45,
      91,    55,    87,   174,   162,    90,    55,    36,   179,    37,
      38,   107,   143,   108,     4,    55,   112,   184,   118,   130,
     139,    39,    61,   142,   153,   154,    62,    13,    63,    64,
     155,   171,   163,    65,    35,    33,    84,    40,    41,   185,
      66,   186,   131,   133,    42,    36,    67,    37,    38,   109,
     134,     0,    43,    44,     0,     0,    45,     0,     0,    39,
       0,   119,   120,   121,   122,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    40,    41,     0,     0,     0,
       0,     0,    42,     0,     0,   123,   124,     0,     0,     0,
      43,    44,   107,     0,    45,     0,     0,     0,   125
};

static const yytype_int16 yycheck[] =
{
      26,     0,    26,    39,    53,    42,   114,     6,    86,     4,
      17,    17,     4,    39,     6,     7,     3,     4,     5,    39,
      27,    41,     4,   114,     6,     7,    18,    53,    65,   137,
     138,    17,    17,    28,    20,    61,    62,    61,    62,    24,
      37,    38,    34,    35,    31,    37,   137,   138,    54,    41,
      87,    17,    34,    35,    20,    91,   105,    49,    50,    41,
     168,    53,    41,   171,    90,    91,     0,    49,    50,   147,
     107,    53,   180,    54,   100,   101,     4,   168,     4,   105,
     171,    42,   119,   120,   121,   122,    48,    49,   125,   180,
       4,    37,     6,     7,     3,     7,     5,    12,    13,    14,
      15,    50,    51,    52,    18,    19,    37,    38,     4,    23,
      39,    25,    26,   139,    38,   139,    30,   154,   117,    40,
      34,    35,    31,    37,    21,    22,     3,    41,     5,    43,
      44,    46,    47,    48,    49,    49,    50,    42,    39,    53,
      16,   167,    41,   167,   143,    17,   172,     4,   172,     6,
       7,    39,    29,    40,    31,   181,    37,   181,    37,    42,
      45,    18,    19,    37,    42,    38,    23,     6,    25,    26,
      40,    24,   145,    30,    25,    23,    31,    34,    35,   182,
      37,   182,    90,   100,    41,     4,    43,     6,     7,    60,
     101,    -1,    49,    50,    -1,    -1,    53,    -1,    -1,    18,
      -1,     8,     9,    10,    11,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    34,    35,    -1,    -1,    -1,
      -1,    -1,    41,    -1,    -1,    32,    33,    -1,    -1,    -1,
      49,    50,    39,    -1,    53,    -1,    -1,    -1,    45
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,     4,     5,    31,    56,    57,    58,    59,    65,
      66,    41,     0,    58,     4,    61,    62,    63,    65,    67,
      68,    69,    39,    41,    37,    38,    54,     4,    70,    71,
      42,    37,     7,    67,     4,    62,     4,     6,     7,    18,
      34,    35,    41,    49,    50,    53,    91,    92,    93,    94,
      96,    98,   100,   101,   102,   103,   104,   105,   108,    39,
      38,    19,    23,    25,    26,    30,    37,    43,    72,    73,
      74,    75,    76,    78,    80,    81,    82,    83,    84,    85,
      89,    90,    91,   103,    69,    40,    42,    41,    93,    90,
      17,    16,    12,    13,    14,    15,    46,    47,    48,    49,
      95,    97,    50,    51,    52,    99,   100,    39,    40,    71,
      91,    91,    37,     4,    28,    37,    90,    86,    37,     8,
       9,    10,    11,    32,    33,    45,    72,    90,   106,   107,
      42,    92,    93,    96,    98,   100,    90,    20,    24,    45,
      73,    74,    37,    29,    60,    64,    65,    88,    90,    90,
      90,    90,    90,    42,    38,    40,    73,    74,    73,    74,
      87,    91,    65,    61,    44,    72,    90,    21,    22,    77,
      79,    24,    27,    37,    91,    73,    74,    73,    74,    91,
      20,    54,    73,    74,    91,    77,    79
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    55,    56,    57,    57,    58,    58,    59,    60,    61,
      61,    62,    62,    63,    63,    64,    64,    65,    65,    65,
      66,    66,    67,    67,    68,    68,    69,    70,    70,    71,
      71,    72,    72,    73,    73,    73,    73,    73,    73,    73,
      74,    74,    74,    75,    76,    77,    77,    78,    78,    78,
      79,    79,    79,    79,    80,    81,    82,    82,    83,    83,
      84,    84,    85,    86,    86,    87,    87,    88,    88,    89,
      89,    90,    90,    90,    90,    90,    90,    90,    90,    91,
      91,    92,    92,    93,    93,    94,    94,    95,    95,    95,
      95,    95,    95,    96,    96,    97,    97,    98,    98,    99,
      99,    99,   100,   100,   101,   101,   101,   102,   102,   103,
     103,   104,   104,   104,   105,   106,   106,   107,   107,   108,
     108,   108,   108
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     3,     3,     3,
       1,     1,     3,     1,     4,     2,     1,     1,     1,     1,
       6,     5,     1,     0,     3,     1,     2,     3,     1,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     5,     5,     2,     4,     4,     5,
       5,     4,     4,     2,     4,     4,     6,     3,     6,     3,
       2,     3,     2,     2,     0,     3,     5,     2,     0,     2,
       1,     3,     2,     2,     3,     3,     3,     3,     1,     3,
       1,     3,     1,     2,     1,     3,     1,     1,     1,     1,
       1,     1,     1,     3,     1,     1,     1,     3,     1,     1,
       1,     1,     2,     1,     1,     1,     1,     1,     1,     1,
       4,     3,     1,     1,     4,     1,     0,     3,     1,     1,
       1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 285 "c-.y" /* yacc.c:1646  */
    { savedTree = (yyvsp[0].treeNode);}
#line 1666 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 290 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-1].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-1].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 1679 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 298 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1685 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 302 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1691 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 303 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1697 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 307 "c-.y" /* yacc.c:1646  */
    {
			TreeNode *t = (yyvsp[-1].treeNode);
			
			while( t != NULL) {
				t->nodetype = (yyvsp[-2].treeNode)->nodetype;
				t = t->sibling;
        		}
			(yyval.treeNode) = (yyvsp[-1].treeNode);

		    }
#line 1712 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 321 "c-.y" /* yacc.c:1646  */
    {
			   (yyval.treeNode) = (yyvsp[-1].treeNode);
			   if ((yyvsp[-2].treeNode)->isStatic) (yyval.treeNode)->isStatic = true;
			   TreeNode *t = (yyvsp[-1].treeNode);
			   while( t != NULL) {
				t->nodetype = (yyvsp[-2].treeNode)->nodetype;
				t->isStatic = true;
				t = t->sibling;
        		   }
		          }
#line 1727 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 336 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-2].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-2].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 1740 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 344 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1746 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 349 "c-.y" /* yacc.c:1646  */
    { 
			   (yyvsp[-2].treeNode)->child[0] = (yyvsp[0].treeNode);
			   (yyval.treeNode) = (yyvsp[-2].treeNode);
		         }
#line 1755 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 357 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(DeclK, VarK, Void, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); 
    		
		}
#line 1764 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 363 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(DeclK, VarK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
		 (yyval.treeNode)->isArray = true;
		 (yyval.treeNode)->arraySize = (yyvsp[-1].tokenData)->numValue;
		}
#line 1774 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 370 "c-.y" /* yacc.c:1646  */
    { (yyvsp[0].treeNode)->isStatic = true; (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1780 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 371 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1786 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 375 "c-.y" /* yacc.c:1646  */
    {  (yyval.treeNode) = newNode(DeclK, TypeK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 1792 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 376 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, TypeK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 1798 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 377 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, TypeK, Char, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 1804 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 381 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, FunK, (yyvsp[-5].treeNode)->nodetype, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
		      (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		      (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		    }
#line 1813 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 386 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, FunK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
		      (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		      (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		    }
#line 1822 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 393 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1828 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 397 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-2].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-2].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 1841 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 405 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1847 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 409 "c-.y" /* yacc.c:1646  */
    {
			TreeNode *t = (yyvsp[0].treeNode);
			
			while( t != NULL) {
				t->nodetype = (yyvsp[-1].treeNode)->nodetype;
				t = t->sibling;
        		}
			(yyval.treeNode) = (yyvsp[0].treeNode);
		    }
#line 1861 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 421 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-2].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-2].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 1874 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 429 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1880 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 432 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, ParamK, Void, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 1886 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 433 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, ParamK, Void, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData)); (yyval.treeNode)->isArray = true; }
#line 1892 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 437 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1898 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 437 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1904 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 440 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1910 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 441 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1916 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 442 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1922 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 443 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1928 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 444 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1934 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 445 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1940 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 446 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1946 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 449 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1952 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 450 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1958 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 451 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1964 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 456 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(StmtK, CompoundK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			  (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
			}
#line 1973 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 463 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, IfK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 1984 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 472 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, ElsifK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 1995 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 479 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2001 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 483 "c-.y" /* yacc.c:1646  */
    { 
			 (yyval.treeNode) = newNode(StmtK, IfK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2011 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 489 "c-.y" /* yacc.c:1646  */
    { 
			 (yyval.treeNode) = newNode(StmtK, IfK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2021 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 496 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, IfK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2032 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 505 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, ElsifK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2043 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 512 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, ElsifK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2053 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 518 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, ElsifK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2063 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 523 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2069 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 528 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, WhileK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2079 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 536 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, WhileK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2089 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 544 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, LoopK, Void, (yyvsp[-5].tokenData)->linenum, (yyvsp[-5].tokenData));
			 TreeNode *idNode = newNode(ExpK, IdK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = idNode;
			 (yyval.treeNode)->child[1] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2101 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 552 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, LoopForeverK, Void, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData));
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2110 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 559 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, LoopK, Void, (yyvsp[-5].tokenData)->linenum, (yyvsp[-5].tokenData));
			 TreeNode *idNode = newNode(ExpK, IdK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = idNode;
			 (yyval.treeNode)->child[1] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2122 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 567 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, LoopForeverK, Void, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData));
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2131 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 574 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(StmtK, ReturnK, Void, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData));
		}
#line 2139 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 578 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(StmtK, ReturnK, Void, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData));
		 (yyval.treeNode)->child[0] = (yyvsp[-1].treeNode);
		}
#line 2148 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 584 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(StmtK, BreakK, Void, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); }
#line 2154 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 588 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-1].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-1].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 2167 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 596 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2173 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 603 "c-.y" /* yacc.c:1646  */
    {
			(yyval.treeNode) = newNode(ExpK, RangeK, Void, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData));
			(yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			(yyval.treeNode)->child[1] = (yyvsp[0].treeNode);

			TokenData *newToken = new TokenData;
			newToken->tokenstr = new char('1');
			newToken->numValue = 1;
			newToken->linenum = (yyvsp[-1].tokenData)->linenum;

			(yyval.treeNode)->child[2] = newNode(ExpK, ConstK, Int, (yyvsp[-1].tokenData)->linenum, newToken);

			
		    }
#line 2192 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 618 "c-.y" /* yacc.c:1646  */
    { 
			(yyval.treeNode) = newNode(ExpK, RangeK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			(yyval.treeNode)->child[0] = (yyvsp[-4].treeNode);
			(yyval.treeNode)->child[1] = (yyvsp[-2].treeNode);
			(yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
		    }
#line 2203 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 628 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-1].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-1].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 2216 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 636 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2222 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 641 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[-1].treeNode); }
#line 2228 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 642 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2234 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 646 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Void, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2243 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 652 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-1].treeNode);
		}
#line 2251 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 656 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-1].treeNode);
		}
#line 2259 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 660 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2268 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 665 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2277 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 670 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2286 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 675 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2295 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 679 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2301 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 683 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2313 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 691 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2319 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 696 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2331 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 703 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2337 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 707 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(ExpK, UnaryK, Bool, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[0].treeNode);
			
			 if ((yyvsp[0].treeNode) != NULL && (yyvsp[0].treeNode)->isConstant) (yyval.treeNode)->isConstant = true;
			 else (yyval.treeNode)->isConstant = false;
			}
#line 2349 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 715 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2355 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 719 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2367 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 726 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2373 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 87:
#line 729 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2379 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 88:
#line 730 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2385 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 89:
#line 731 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2391 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 90:
#line 732 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2397 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 733 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2403 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 734 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2409 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 738 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2421 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 94:
#line 746 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2427 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 749 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2433 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 96:
#line 750 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2439 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 97:
#line 754 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2451 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 98:
#line 762 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2457 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 99:
#line 765 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2463 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 100:
#line 766 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2469 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 101:
#line 767 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2475 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 102:
#line 772 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = (yyvsp[-1].treeNode);
			 for (int i = 0; i <= 2; i++)
				if ((yyval.treeNode)->child[i] == NULL){ (yyval.treeNode)->child[i] = (yyvsp[0].treeNode); break; }
			
			 if ((yyvsp[0].treeNode) != NULL && (yyvsp[0].treeNode)->isConstant) (yyval.treeNode)->isConstant = true;
			 else (yyval.treeNode)->isConstant = false;
		
			}
#line 2489 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 103:
#line 781 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2495 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 104:
#line 784 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, UnaryK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2501 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 105:
#line 785 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, UnaryK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2507 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 106:
#line 786 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, UnaryK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2513 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 107:
#line 790 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2519 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 108:
#line 790 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2525 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 109:
#line 793 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, IdK, Void, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2531 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 110:
#line 795 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(ExpK, OpK, Void, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData));
		 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);

		 (yyvsp[-1].treeNode)->isIndex = true;
		 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
		}
#line 2543 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 111:
#line 804 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[-1].treeNode); }
#line 2549 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 112:
#line 805 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2555 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 113:
#line 806 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2561 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 114:
#line 811 "c-.y" /* yacc.c:1646  */
    {
		 if ((yyvsp[-1].treeNode) != NULL){
			(yyval.treeNode) = newNode(ExpK, CallK, (yyvsp[-1].treeNode)->nodetype, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			(yyval.treeNode)->child[0] = (yyvsp[-1].treeNode);
		 }
		 else{
			(yyval.treeNode) = newNode(ExpK, CallK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
		 }
		}
#line 2575 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 115:
#line 823 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2581 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 116:
#line 824 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2587 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 117:
#line 829 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-2].treeNode);
	           if (t != NULL) {
                       while (t->sibling != NULL){ t = t->sibling; }
                       t->sibling = (yyvsp[0].treeNode);
                       (yyval.treeNode) = (yyvsp[-2].treeNode);
                   }
                   else { (yyval.treeNode) = (yyvsp[0].treeNode);}
	         }
#line 2600 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 118:
#line 837 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2606 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 119:
#line 843 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, ConstK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData));
                   (yyval.treeNode)->isConstant = true;
                 }
#line 2614 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 120:
#line 847 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, ConstK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData));
		  (yyval.treeNode)->isConstant = true;
		}
#line 2622 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 121:
#line 851 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, ConstK, Char, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData));
		  (yyval.treeNode)->isConstant = true;
		}
#line 2630 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 122:
#line 855 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, ConstK, Char, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData));
		  (yyval.treeNode)->isConstant = true;
		  (yyval.treeNode)->isArray = true;
		}
#line 2639 "c-.tab.c" /* yacc.c:1646  */
    break;


#line 2643 "c-.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 862 "c-.y" /* yacc.c:1906  */


int main(int argc, char* argv[])
{
	int c;
	extern char *optarg;
	extern int optind;
	int pflg = 0;
	int dflg = 0;
	bool printFlag = false;
	int optCount = 1;

	while ((c = ourGetopt(argc, argv, (char *)"pd:")) != EOF){
	   switch (c) {
	   case	'p':
	       printFlag = true;
	       break;

	   case	'd':
	        yydebug=1;
		break;
	    }
	    optCount++;
	}

        if (argc > 1){
            if ((yyin = fopen(argv[optCount], "r"))){
		yyparse();   // call the parse
		if (printFlag) printTree(savedTree, 0, -1, false, false, "");
            }

            else{
                yyin = stdin;
		yyparse();   // call the parse
		if (printFlag) printTree(savedTree, 0, -1, false, false, "");
            }
        }

	return 0;
}

