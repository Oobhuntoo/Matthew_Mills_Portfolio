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
 
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "scanType.h"
#include "globals.h"
#include "util.h"
#include <string>
#include <vector>
#include <map>
#include <iostream>
#include "ourgetopt.h"
#include "printTree.h"
#include "semantic.h"
#include "yyerror.h"

using namespace std;

TreeNode *savedTree; /* stores syntax tree for later return */

#ifdef CPLUSPLUS
extern int yylex();
extern FILE* yyin;
#endif

extern int yylineno;
#define YYERROR_VERBOSE 1

extern int syntax_error;
extern int syntax_warning;

void printTree(TreeNode *tree, int childnum, int siblingnum, bool calledAsChild, bool calledAsSibling, string formatStr);



// This is the yyerror called by the bison parser for errors.
// It only does errors and not warnings.   
void yyerror(const char *msg);



#line 108 "c-.tab.c" /* yacc.c:339  */

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
#line 44 "c-.y" /* yacc.c:355  */

    TreeNode *treeNode;
    TokenData *tokenData;

#line 190 "c-.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_C_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 207 "c-.tab.c" /* yacc.c:358  */

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
#define YYFINAL  18
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   934

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  55
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  54
/* YYNRULES -- Number of rules.  */
#define YYNRULES  171
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  275

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
       0,    65,    65,    69,    78,    82,    83,    84,    87,   100,
     101,   106,   119,   120,   125,   135,   137,   141,   142,   149,
     150,   155,   161,   168,   169,   173,   174,   178,   179,   180,
     183,   188,   193,   194,   195,   196,   197,   200,   201,   204,
     214,   215,   216,   219,   231,   241,   242,   243,   246,   247,
     253,   253,   256,   257,   258,   259,   260,   261,   262,   265,
     266,   267,   271,   279,   280,   283,   291,   292,   295,   303,
     304,   306,   307,   310,   316,   323,   331,   332,   335,   342,
     348,   354,   360,   367,   371,   378,   379,   382,   390,   396,
     397,   398,   403,   411,   417,   424,   428,   436,   439,   448,
     454,   469,   477,   478,   482,   491,   496,   497,   500,   506,
     508,   514,   516,   522,   524,   529,   534,   539,   544,   545,
     548,   557,   559,   563,   571,   573,   577,   586,   588,   591,
     599,   601,   605,   606,   607,   608,   609,   610,   613,   622,
     624,   627,   628,   631,   640,   642,   645,   646,   647,   651,
     661,   663,   666,   667,   668,   672,   672,   675,   676,   686,
     687,   688,   690,   695,   710,   711,   715,   725,   731,   735,
     739,   743
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

#define YYPACT_NINF -197

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-197)))

#define YYTABLE_NINF -166

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     382,    38,  -197,   -13,  -197,  -197,    23,   321,  -197,  -197,
     152,  -197,   -27,    -7,   171,  -197,   -14,   107,  -197,  -197,
     -25,    68,   201,  -197,   539,    81,  -197,   180,   564,   -18,
     184,    18,    61,  -197,  -197,   271,  -197,    74,  -197,  -197,
     577,  -197,  -197,   590,  -197,  -197,  -197,   114,   135,  -197,
    -197,   128,    42,  -197,   792,  -197,   118,  -197,  -197,  -197,
    -197,   122,   -27,  -197,  -197,   114,  -197,   132,   159,  -197,
     354,   270,   -18,   125,   506,  -197,  -197,    84,   160,   114,
     889,   603,   628,  -197,  -197,  -197,  -197,  -197,  -197,  -197,
    -197,   833,   843,  -197,  -197,  -197,   853,  -197,  -197,   641,
    -197,   173,   185,   113,   654,   667,   182,    16,   526,  -197,
    -197,  -197,  -197,  -197,  -197,  -197,  -197,  -197,  -197,  -197,
    -197,  -197,  -197,  -197,   194,  -197,  -197,   392,    33,  -197,
     168,   190,  -197,  -197,   234,  -197,   641,   641,   641,   641,
    -197,  -197,   641,  -197,   135,  -197,  -197,  -197,   175,  -197,
      42,  -197,  -197,   200,  -197,  -197,  -197,   223,   170,   229,
     120,  -197,     6,   430,  -197,   210,   313,  -197,   113,  -197,
    -197,   641,  -197,  -197,  -197,  -197,  -197,  -197,  -197,   430,
     430,   430,   430,  -197,   692,    33,  -197,  -197,  -197,    17,
     101,  -197,   191,  -197,   129,  -197,    24,  -197,   211,  -197,
    -197,  -197,  -197,  -197,   235,   246,    62,  -197,   213,  -197,
      85,   219,  -197,  -197,   236,   705,   430,  -197,   705,   430,
    -197,  -197,   430,   430,   718,  -197,  -197,  -197,  -197,   257,
     181,  -197,  -197,   186,  -197,  -197,  -197,  -197,  -197,  -197,
       9,   468,   468,   430,   731,   756,   769,    55,   102,   102,
     262,  -197,  -197,   114,   258,   187,   255,   144,    10,   468,
     468,  -197,  -197,  -197,   468,   468,   468,   468,   782,   102,
     102,   265,   266,   468,   468
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,    27,     0,    28,    29,     0,     0,     4,     5,
       0,     6,     0,    21,     0,    16,    17,     0,     1,     3,
      32,    21,     0,    24,     0,     0,     9,     0,     0,    35,
       0,     0,    37,    41,    10,     0,     8,   157,   169,   168,
       0,   170,   171,     0,   152,   153,   154,    19,   121,   124,
     127,   130,   139,   144,     0,   150,   155,   156,   160,   161,
      23,     0,    15,    14,    20,    18,    47,    48,    43,    46,
       0,     0,    33,     0,     0,   128,   126,   162,     0,   118,
     155,     0,     0,   136,   132,   135,   137,   133,   134,   141,
     142,     0,     0,   147,   146,   148,     0,   151,   149,     0,
      22,     0,     0,    36,     0,     0,     0,     0,     0,   107,
      99,    31,    50,    51,    53,    54,    59,    55,    60,    56,
      61,    57,    58,    52,     0,    40,    39,     0,   119,   167,
       0,   164,   113,   111,     0,   159,     0,     0,     0,     0,
     112,   110,     0,   122,   120,   125,   123,   131,   129,   140,
     138,   145,   143,     0,    49,    45,    44,    66,     0,    86,
       0,    97,     0,     0,    95,     0,     0,   106,    34,    30,
     163,     0,   109,   114,   115,   117,   116,   108,   158,     0,
       0,     0,     0,    91,     0,    64,    88,    93,    96,     0,
       0,    98,     0,    26,     0,   166,     0,    76,     0,    73,
      83,    85,    82,    84,    90,     0,     0,    63,     0,    25,
       0,     0,    62,   104,     0,     0,     0,    67,     0,     0,
      65,    75,     0,     0,     0,    13,    12,    11,    72,    69,
       0,    71,    77,     0,    81,    89,    94,    87,    92,   103,
     100,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,   102,   101,    66,     0,     0,     0,     0,     0,
       0,    70,    68,    78,     0,     0,     0,     0,     0,     0,
       0,    90,     0,     0,     0
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -197,  -197,  -197,   275,  -197,  -197,    -9,   259,  -197,  -197,
       3,  -197,   256,  -197,   224,  -197,   192,  -119,  -146,  -132,
    -197,  -197,  -196,  -197,    48,  -197,  -197,  -197,  -197,  -197,
    -197,  -197,    32,  -197,  -197,   -37,   -19,   226,   -26,  -197,
    -197,   217,  -197,   212,  -197,   -32,  -197,  -197,   -24,  -197,
    -197,  -197,  -197,  -197
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,     7,     8,     9,   191,    14,    15,    16,   192,
      30,    11,    31,    32,    33,    68,    69,   111,   112,   113,
     114,   115,   217,   116,   221,   117,   118,   119,   120,   121,
     122,   166,   205,   194,   123,   124,    79,    48,    49,    50,
      91,    51,    92,    52,    96,    53,    54,    55,    80,    57,
      58,   130,   131,    59
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      56,    22,   220,    10,    56,    47,    78,   183,   169,    65,
      10,   183,    34,    23,    76,    23,    56,   186,    12,   -42,
     162,    13,    98,    18,   -42,   214,    81,    24,    17,    24,
      56,   187,    25,   196,   198,   200,   202,   129,    -7,    12,
      28,    -7,    13,    -7,   163,   215,   216,   197,   199,   201,
     203,   184,   261,   262,   262,   268,   146,    56,    56,   258,
      70,   207,   153,   244,   152,   132,   133,    56,    56,    -7,
     231,   165,    56,   231,   220,   213,   235,   237,   134,    81,
      56,    56,    60,   259,   232,   158,   160,   234,    61,   224,
     236,   238,    93,    94,    95,   248,   249,   250,    71,   173,
     174,   175,   176,   214,     2,   177,     4,    25,    29,    35,
       2,   251,     4,   186,   231,    74,   132,   133,   269,   270,
     200,   202,   226,   215,   260,    23,  -119,   235,   237,   134,
     185,    81,     5,    37,   195,    38,    39,    81,     5,    24,
      83,    84,    85,    86,   182,   132,   133,    40,   104,   -38,
    -119,    82,   105,    20,   106,   107,    21,    99,   134,   108,
      56,    81,   100,    41,    42,   206,   109,   127,   267,   193,
      43,   101,   110,   212,    87,    88,    89,    90,    44,    45,
     208,    62,    46,   211,    13,    66,   155,    81,    67,    67,
     180,    56,   210,   209,    56,    13,   230,   102,    81,   233,
      56,   242,   135,    81,    81,   240,   243,   265,    26,    27,
     170,   -74,   214,   154,   -74,   -74,   -74,   -74,   -74,   161,
      56,    56,    56,    89,    90,   253,   255,   257,   171,   -74,
     -74,   167,   218,   219,   -74,   172,   -74,   -74,    36,    27,
     178,   -74,   -74,   179,    56,   -74,   -74,   188,   -74,   206,
     225,    27,   -74,   181,   -74,   -74,   227,    27,   228,   222,
     -74,   -74,   -79,   214,   -74,   -79,   -79,   -79,   -79,   -79,
     223,   125,    72,     2,     2,     4,     4,   241,   264,   266,
     -79,   -79,    19,   218,   219,   -79,    63,   -79,   -79,   273,
     274,    73,   -79,   -79,   156,   126,   -79,   -79,   263,   -79,
     272,     5,     5,   -79,   150,   -79,   -79,   144,   148,     0,
       0,   -79,   -79,   -38,   189,   -79,     2,  -105,     4,  -105,
    -105,    -2,     1,     0,     2,     3,     4,     0,     0,     0,
       0,  -105,  -105,     0,     0,     0,  -105,     0,  -105,  -105,
       0,     0,   190,  -105,     5,     0,     0,  -105,  -105,     0,
    -105,     0,     5,     0,  -105,   103,  -105,  -105,    37,     0,
      38,    39,  -105,  -105,     0,     0,  -105,     0,     0,     0,
       0,     0,    40,   104,     0,     0,     0,   105,     0,   106,
     107,     0,     0,     1,   108,     2,     3,     4,    41,    42,
       0,   109,     0,   168,     0,    43,    37,   110,    38,    39,
       0,     0,     0,    44,    45,     0,     0,    46,     0,     0,
      40,   104,     0,     5,     0,   105,     0,   106,   107,     0,
       0,     0,   108,     0,     0,     0,    41,    42,     0,   109,
       0,   185,     0,    43,    37,   110,    38,    39,     0,     0,
       0,    44,    45,     0,     0,    46,     0,     0,    40,   104,
       0,     0,     0,   105,     0,   106,   107,     0,     0,     0,
     108,     0,     0,     0,    41,    42,     0,   109,     0,   185,
       0,    43,    37,   110,    38,    39,     0,     0,     0,    44,
      45,     0,     0,    46,     0,     0,    40,   245,     0,     0,
       0,   246,     0,   106,   247,     0,     0,     0,   108,     0,
       0,     0,    41,    42,     0,   109,     0,   128,     0,    43,
      37,   110,    38,    39,     0,     0,     0,    44,    45,     0,
       0,    46,     0,     0,    40,     0,     0,   128,     0,     0,
      37,     0,    38,    39,     0,     0,     0,     0,     0,     0,
      41,    42,     0,    37,    40,    38,    39,    43,  -165,     0,
       0,     0,     0,     0,     0,    44,    45,    40,     0,    46,
      41,    42,     0,   164,     0,    64,     0,    43,    37,     0,
      38,    39,     0,    41,    42,    44,    45,     0,    75,    46,
      43,    37,    40,    38,    39,     0,     0,     0,    44,    45,
       0,    77,    46,     0,    37,    40,    38,    39,    41,    42,
       0,     0,     0,     0,   143,    43,     0,    37,    40,    38,
      39,    41,    42,    44,    45,     0,     0,    46,    43,     0,
       0,    40,     0,     0,    41,    42,    44,    45,     0,   145,
      46,    43,    37,     0,    38,    39,     0,    41,    42,    44,
      45,     0,   128,    46,    43,    37,    40,    38,    39,     0,
       0,     0,    44,    45,     0,   157,    46,     0,    37,    40,
      38,    39,    41,    42,     0,     0,     0,     0,   159,    43,
       0,    37,    40,    38,    39,    41,    42,    44,    45,     0,
       0,    46,    43,     0,     0,    40,     0,     0,    41,    42,
      44,    45,     0,   204,    46,    43,    37,     0,    38,    39,
       0,    41,    42,    44,    45,     0,   229,    46,    43,    37,
      40,    38,    39,     0,     0,     0,    44,    45,     0,   239,
      46,     0,    37,    40,    38,    39,    41,    42,     0,     0,
       0,     0,   252,    43,     0,    37,    40,    38,    39,    41,
      42,    44,    45,     0,     0,    46,    43,     0,     0,    40,
       0,     0,    41,    42,    44,    45,     0,   254,    46,    43,
      37,     0,    38,    39,     0,    41,    42,    44,    45,     0,
     256,    46,    43,    37,    40,    38,    39,     0,     0,     0,
      44,    45,     0,   271,    46,     0,    37,    40,    38,    39,
      41,    42,     0,    97,     0,     0,    37,    43,    38,    39,
      40,     0,     0,    41,    42,    44,    45,     0,     0,    46,
      43,     0,     0,     0,     0,     0,    41,    42,    44,    45,
       0,     0,    46,    43,     0,     0,    41,    42,     0,     0,
       0,    44,    45,    43,   147,    46,     0,    37,     0,    38,
      39,    44,    45,     0,   149,    46,     0,    37,     0,    38,
      39,     0,     0,     0,   151,     0,     0,    37,     0,    38,
      39,     0,     0,     0,     0,     0,     0,    41,    42,     0,
       0,     0,     0,     0,    43,     0,     0,    41,    42,     0,
       0,     0,    44,    45,    43,     0,    46,    41,    42,     0,
       0,     0,    44,    45,    43,     0,    46,   136,   137,   138,
     139,     0,    44,    45,     0,     0,    46,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   140,   141,     0,     0,     0,     0,     0,    99,     0,
       0,     0,     0,     0,   142
};

static const yytype_int16 yycheck[] =
{
      24,    10,   198,     0,    28,    24,    43,     1,   127,    28,
       7,     1,    37,    40,    40,    40,    40,   163,     1,    37,
       4,     4,    54,     0,    42,     1,    17,    54,    41,    54,
      54,   163,    39,   179,   180,   181,   182,    74,     0,     1,
      54,     3,     4,     5,    28,    21,    22,   179,   180,   181,
     182,    45,   248,   249,   250,    45,    82,    81,    82,     4,
      42,    44,    99,    54,    96,    32,    33,    91,    92,    31,
     216,   108,    96,   219,   270,   194,   222,   223,    45,    17,
     104,   105,     1,    28,   216,   104,   105,   219,     7,    27,
     222,   223,    50,    51,    52,   241,   242,   243,    37,   136,
     137,   138,   139,     1,     3,   142,     5,    39,     1,    41,
       3,   243,     5,   259,   260,    41,    32,    33,   264,   265,
     266,   267,    37,    21,    22,    40,    42,   273,   274,    45,
       1,    17,    31,     4,   171,     6,     7,    17,    31,    54,
      12,    13,    14,    15,    24,    32,    33,    18,    19,    42,
      37,    16,    23,     1,    25,    26,     4,    39,    45,    30,
     184,    17,    40,    34,    35,   184,    37,    42,    24,   166,
      41,    39,    43,    44,    46,    47,    48,    49,    49,    50,
     189,     1,    53,   192,     4,     1,     1,    17,     4,     4,
      20,   215,     1,   190,   218,     4,   215,    38,    17,   218,
     224,    20,    42,    17,    17,   224,    20,    20,    37,    38,
      42,     0,     1,    40,     3,     4,     5,     6,     7,    37,
     244,   245,   246,    48,    49,   244,   245,   246,    38,    18,
      19,    37,    21,    22,    23,     1,    25,    26,    37,    38,
      40,    30,    31,    20,   268,    34,    35,    37,    37,   268,
      37,    38,    41,    24,    43,    44,    37,    38,    22,    24,
      49,    50,     0,     1,    53,     3,     4,     5,     6,     7,
      24,     1,     1,     3,     3,     5,     5,    20,    20,    24,
      18,    19,     7,    21,    22,    23,    27,    25,    26,    24,
      24,    35,    30,    31,   102,    71,    34,    35,   250,    37,
     268,    31,    31,    41,    92,    43,    44,    81,    91,    -1,
      -1,    49,    50,    42,     1,    53,     3,     4,     5,     6,
       7,     0,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    18,    19,    -1,    -1,    -1,    23,    -1,    25,    26,
      -1,    -1,    29,    30,    31,    -1,    -1,    34,    35,    -1,
      37,    -1,    31,    -1,    41,     1,    43,    44,     4,    -1,
       6,     7,    49,    50,    -1,    -1,    53,    -1,    -1,    -1,
      -1,    -1,    18,    19,    -1,    -1,    -1,    23,    -1,    25,
      26,    -1,    -1,     1,    30,     3,     4,     5,    34,    35,
      -1,    37,    -1,     1,    -1,    41,     4,    43,     6,     7,
      -1,    -1,    -1,    49,    50,    -1,    -1,    53,    -1,    -1,
      18,    19,    -1,    31,    -1,    23,    -1,    25,    26,    -1,
      -1,    -1,    30,    -1,    -1,    -1,    34,    35,    -1,    37,
      -1,     1,    -1,    41,     4,    43,     6,     7,    -1,    -1,
      -1,    49,    50,    -1,    -1,    53,    -1,    -1,    18,    19,
      -1,    -1,    -1,    23,    -1,    25,    26,    -1,    -1,    -1,
      30,    -1,    -1,    -1,    34,    35,    -1,    37,    -1,     1,
      -1,    41,     4,    43,     6,     7,    -1,    -1,    -1,    49,
      50,    -1,    -1,    53,    -1,    -1,    18,    19,    -1,    -1,
      -1,    23,    -1,    25,    26,    -1,    -1,    -1,    30,    -1,
      -1,    -1,    34,    35,    -1,    37,    -1,     1,    -1,    41,
       4,    43,     6,     7,    -1,    -1,    -1,    49,    50,    -1,
      -1,    53,    -1,    -1,    18,    -1,    -1,     1,    -1,    -1,
       4,    -1,     6,     7,    -1,    -1,    -1,    -1,    -1,    -1,
      34,    35,    -1,     4,    18,     6,     7,    41,    42,    -1,
      -1,    -1,    -1,    -1,    -1,    49,    50,    18,    -1,    53,
      34,    35,    -1,    37,    -1,     1,    -1,    41,     4,    -1,
       6,     7,    -1,    34,    35,    49,    50,    -1,     1,    53,
      41,     4,    18,     6,     7,    -1,    -1,    -1,    49,    50,
      -1,     1,    53,    -1,     4,    18,     6,     7,    34,    35,
      -1,    -1,    -1,    -1,     1,    41,    -1,     4,    18,     6,
       7,    34,    35,    49,    50,    -1,    -1,    53,    41,    -1,
      -1,    18,    -1,    -1,    34,    35,    49,    50,    -1,     1,
      53,    41,     4,    -1,     6,     7,    -1,    34,    35,    49,
      50,    -1,     1,    53,    41,     4,    18,     6,     7,    -1,
      -1,    -1,    49,    50,    -1,     1,    53,    -1,     4,    18,
       6,     7,    34,    35,    -1,    -1,    -1,    -1,     1,    41,
      -1,     4,    18,     6,     7,    34,    35,    49,    50,    -1,
      -1,    53,    41,    -1,    -1,    18,    -1,    -1,    34,    35,
      49,    50,    -1,     1,    53,    41,     4,    -1,     6,     7,
      -1,    34,    35,    49,    50,    -1,     1,    53,    41,     4,
      18,     6,     7,    -1,    -1,    -1,    49,    50,    -1,     1,
      53,    -1,     4,    18,     6,     7,    34,    35,    -1,    -1,
      -1,    -1,     1,    41,    -1,     4,    18,     6,     7,    34,
      35,    49,    50,    -1,    -1,    53,    41,    -1,    -1,    18,
      -1,    -1,    34,    35,    49,    50,    -1,     1,    53,    41,
       4,    -1,     6,     7,    -1,    34,    35,    49,    50,    -1,
       1,    53,    41,     4,    18,     6,     7,    -1,    -1,    -1,
      49,    50,    -1,     1,    53,    -1,     4,    18,     6,     7,
      34,    35,    -1,     1,    -1,    -1,     4,    41,     6,     7,
      18,    -1,    -1,    34,    35,    49,    50,    -1,    -1,    53,
      41,    -1,    -1,    -1,    -1,    -1,    34,    35,    49,    50,
      -1,    -1,    53,    41,    -1,    -1,    34,    35,    -1,    -1,
      -1,    49,    50,    41,     1,    53,    -1,     4,    -1,     6,
       7,    49,    50,    -1,     1,    53,    -1,     4,    -1,     6,
       7,    -1,    -1,    -1,     1,    -1,    -1,     4,    -1,     6,
       7,    -1,    -1,    -1,    -1,    -1,    -1,    34,    35,    -1,
      -1,    -1,    -1,    -1,    41,    -1,    -1,    34,    35,    -1,
      -1,    -1,    49,    50,    41,    -1,    53,    34,    35,    -1,
      -1,    -1,    49,    50,    41,    -1,    53,     8,     9,    10,
      11,    -1,    49,    50,    -1,    -1,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    32,    33,    -1,    -1,    -1,    -1,    -1,    39,    -1,
      -1,    -1,    -1,    -1,    45
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,    31,    56,    57,    58,    59,
      65,    66,     1,     4,    61,    62,    63,    41,     0,    58,
       1,     4,    61,    40,    54,    39,    37,    38,    54,     1,
      65,    67,    68,    69,    37,    41,    37,     4,     6,     7,
      18,    34,    35,    41,    49,    50,    53,    91,    92,    93,
      94,    96,    98,   100,   101,   102,   103,   104,   105,   108,
       1,     7,     1,    62,     1,    91,     1,     4,    70,    71,
      42,    37,     1,    67,    41,     1,    93,     1,    90,    91,
     103,    17,    16,    12,    13,    14,    15,    46,    47,    48,
      49,    95,    97,    50,    51,    52,    99,     1,   100,    39,
      40,    39,    38,     1,    19,    23,    25,    26,    30,    37,
      43,    72,    73,    74,    75,    76,    78,    80,    81,    82,
      83,    84,    85,    89,    90,     1,    69,    42,     1,    90,
     106,   107,    32,    33,    45,    42,     8,     9,    10,    11,
      32,    33,    45,     1,    92,     1,    93,     1,    96,     1,
      98,     1,   100,    90,    40,     1,    71,     1,    91,     1,
      91,    37,     4,    28,    37,    90,    86,    37,     1,    72,
      42,    38,     1,    90,    90,    90,    90,    90,    40,    20,
      20,    24,    24,     1,    45,     1,    73,    74,    37,     1,
      29,    60,    64,    65,    88,    90,    73,    74,    73,    74,
      73,    74,    73,    74,     1,    87,    91,    44,    61,    65,
       1,    61,    44,    72,     1,    21,    22,    77,    21,    22,
      77,    79,    24,    24,    27,    37,    37,    37,    22,     1,
      91,    73,    74,    91,    74,    73,    74,    73,    74,     1,
      91,    20,    20,    20,    54,    19,    23,    26,    73,    73,
      73,    74,     1,    91,     1,    91,     1,    91,     4,    28,
      22,    77,    77,    79,    20,    20,    24,    24,    45,    73,
      73,     1,    87,    24,    24
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    55,    56,    57,    57,    58,    58,    58,    59,    59,
      59,    60,    60,    60,    61,    61,    61,    62,    62,    62,
      62,    63,    63,    63,    63,    64,    64,    65,    65,    65,
      66,    66,    66,    66,    66,    66,    66,    67,    67,    68,
      68,    68,    68,    69,    70,    70,    70,    70,    71,    71,
      72,    72,    73,    73,    73,    73,    73,    73,    73,    74,
      74,    74,    75,    75,    75,    76,    76,    76,    77,    77,
      77,    77,    77,    78,    78,    78,    78,    78,    79,    79,
      79,    79,    80,    80,    81,    81,    81,    82,    82,    82,
      82,    82,    83,    83,    83,    84,    84,    85,    86,    86,
      87,    87,    87,    87,    88,    88,    89,    89,    90,    90,
      90,    90,    90,    90,    90,    90,    90,    90,    90,    90,
      91,    91,    91,    92,    92,    92,    93,    93,    93,    94,
      94,    94,    95,    95,    95,    95,    95,    95,    96,    96,
      96,    97,    97,    98,    98,    98,    99,    99,    99,   100,
     100,   100,   101,   101,   101,   102,   102,   103,   103,   104,
     104,   104,   104,   105,   106,   106,   107,   107,   108,   108,
     108,   108
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     1,     1,     3,     3,
       3,     1,     4,     3,     2,     2,     1,     1,     1,     1,
       6,     5,     2,     4,     6,     3,     5,     1,     0,     3,
       3,     1,     1,     2,     3,     3,     1,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     4,     1,     5,     2,     5,     5,     2,
       5,     2,     2,     4,     4,     5,     4,     6,     5,     4,
       4,     2,     4,     4,     4,     4,     2,     6,     3,     6,
       4,     3,     6,     3,     6,     2,     3,     2,     2,     0,
       3,     5,     5,     3,     2,     0,     2,     1,     3,     3,
       2,     2,     2,     2,     3,     3,     3,     3,     1,     1,
       3,     1,     3,     3,     1,     3,     2,     1,     2,     3,
       1,     3,     1,     1,     1,     1,     1,     1,     3,     1,
       3,     1,     1,     3,     1,     3,     1,     1,     1,     2,
       1,     2,     1,     1,     1,     1,     1,     1,     4,     3,
       1,     1,     2,     4,     1,     0,     3,     1,     1,     1,
       1,     1
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
#line 65 "c-.y" /* yacc.c:1646  */
    { savedTree = (yyvsp[0].treeNode);}
#line 1627 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 70 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-1].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-1].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 1640 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 78 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1646 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 82 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1652 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 83 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1658 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 84 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1664 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 88 "c-.y" /* yacc.c:1646  */
    {
			TreeNode *t = (yyvsp[-1].treeNode);
			
			while( t != NULL) {
				t->nodetype = (yyvsp[-2].treeNode)->nodetype;
				t = t->sibling;
        		}
			(yyval.treeNode) = (yyvsp[-1].treeNode);
			yyerrok;

		    }
#line 1680 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 100 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1686 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 101 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1692 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 107 "c-.y" /* yacc.c:1646  */
    {
			   (yyval.treeNode) = (yyvsp[-1].treeNode);
			   if ((yyvsp[-2].treeNode)->isStatic) (yyval.treeNode)->isStatic = true;
			   TreeNode *t = (yyvsp[-1].treeNode);
			   while( t != NULL) {
				t->nodetype = (yyvsp[-2].treeNode)->nodetype;
				t->isStatic = true;
				t = t->sibling;
        		   }
			   yyerrok;
		          }
#line 1708 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 119 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 1714 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 120 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 1720 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 126 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-2].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-2].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
			   yyerrok;
		         }
#line 1734 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 135 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1740 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 137 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1746 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 143 "c-.y" /* yacc.c:1646  */
    { 
			   (yyvsp[-2].treeNode)->child[0] = (yyvsp[0].treeNode);
			   (yyval.treeNode) = (yyvsp[-2].treeNode);
			   (yyval.treeNode)->isInitialized = true;
		         }
#line 1756 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 149 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 1762 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 150 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1768 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 156 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(DeclK, VarK, Void, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); 
    		
		}
#line 1777 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 162 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(DeclK, VarK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
		 (yyval.treeNode)->isArray = true;
		 (yyval.treeNode)->arraySize = (yyvsp[-1].tokenData)->numValue;
		}
#line 1787 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 168 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1793 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 169 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 1799 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 173 "c-.y" /* yacc.c:1646  */
    { (yyvsp[0].treeNode)->isStatic = true; (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1805 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 174 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1811 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 178 "c-.y" /* yacc.c:1646  */
    {  (yyval.treeNode) = newNode(DeclK, TypeK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 1817 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 179 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, TypeK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 1823 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 180 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, TypeK, Char, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 1829 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 184 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, FunK, (yyvsp[-5].treeNode)->nodetype, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
		      (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		      (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		    }
#line 1838 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 189 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, FunK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
		      (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		      (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		    }
#line 1847 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 193 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL;}
#line 1853 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 194 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL;}
#line 1859 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 195 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL;}
#line 1865 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 196 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL;}
#line 1871 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 197 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL;}
#line 1877 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 201 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1883 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 205 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-2].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-2].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 1896 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 214 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1902 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 215 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1908 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 216 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1914 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 220 "c-.y" /* yacc.c:1646  */
    {
			TreeNode *t = (yyvsp[0].treeNode);
			
			while( t != NULL) {
				t->nodetype = (yyvsp[-1].treeNode)->nodetype;
				t = t->sibling;
        		}
			(yyval.treeNode) = (yyvsp[0].treeNode);
		    }
#line 1928 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 232 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-2].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-2].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
			  yyerrok;
		         }
#line 1942 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 241 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1948 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 242 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1954 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 243 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 1960 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 246 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, ParamK, Void, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 1966 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 247 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(DeclK, ParamK, Void, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData)); (yyval.treeNode)->isArray = true; }
#line 1972 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 253 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1978 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 253 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1984 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 256 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1990 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 257 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 1996 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 258 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2002 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 259 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2008 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 260 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2014 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 261 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2020 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 262 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2026 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 265 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2032 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 266 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2038 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 267 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2044 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 272 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(StmtK, CompoundK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			  (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);

			  yyerrok;
			}
#line 2055 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 279 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 2061 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 280 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2067 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 284 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, IfK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2078 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 291 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL;}
#line 2084 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 292 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok;}
#line 2090 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 296 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, ElsifK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2101 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 303 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL;}
#line 2107 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 304 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode)=NULL;yyerrok;}
#line 2113 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 306 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2119 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 307 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL ; }
#line 2125 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 311 "c-.y" /* yacc.c:1646  */
    { 
			 (yyval.treeNode) = newNode(StmtK, IfK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2135 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 317 "c-.y" /* yacc.c:1646  */
    { 
			 (yyval.treeNode) = newNode(StmtK, IfK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2145 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 324 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, IfK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2156 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 331 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok;}
#line 2162 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 332 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok;}
#line 2168 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 336 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, ElsifK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2179 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 343 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, ElsifK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2189 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 349 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, ElsifK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2199 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 354 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2205 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 361 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, WhileK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2215 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 367 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 2221 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 372 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, WhileK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2231 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 378 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 2237 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 379 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL;}
#line 2243 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 87:
#line 383 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, LoopK, Void, (yyvsp[-5].tokenData)->linenum, (yyvsp[-5].tokenData));
			 TreeNode *idNode = newNode(ExpK, IdK, Int, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = idNode;
			 (yyval.treeNode)->child[1] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2255 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 88:
#line 391 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, LoopForeverK, Void, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData));
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2264 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 89:
#line 396 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 2270 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 90:
#line 397 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2276 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 398 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2282 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 404 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, LoopK, Void, (yyvsp[-5].tokenData)->linenum, (yyvsp[-5].tokenData));
			 TreeNode *idNode = newNode(ExpK, IdK, Void, (yyvsp[-4].tokenData)->linenum, (yyvsp[-4].tokenData));
			 (yyval.treeNode)->child[0] = idNode;
			 (yyval.treeNode)->child[1] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
			}
#line 2294 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 412 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(StmtK, LoopForeverK, Void, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData));
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			}
#line 2303 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 94:
#line 417 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 2309 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 425 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(StmtK, ReturnK, Void, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData));
		}
#line 2317 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 96:
#line 429 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(StmtK, ReturnK, Void, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData));
		 (yyval.treeNode)->child[0] = (yyvsp[-1].treeNode);
		 yyerrok;
		}
#line 2327 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 97:
#line 436 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(StmtK, BreakK, Void, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); }
#line 2333 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 98:
#line 440 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-1].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-1].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 2346 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 99:
#line 448 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2352 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 100:
#line 455 "c-.y" /* yacc.c:1646  */
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
#line 2371 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 101:
#line 470 "c-.y" /* yacc.c:1646  */
    { 
			(yyval.treeNode) = newNode(ExpK, RangeK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			(yyval.treeNode)->child[0] = (yyvsp[-4].treeNode);
			(yyval.treeNode)->child[1] = (yyvsp[-2].treeNode);
			(yyval.treeNode)->child[2] = (yyvsp[0].treeNode);
		    }
#line 2382 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 102:
#line 477 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2388 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 103:
#line 478 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2394 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 104:
#line 483 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-1].treeNode);
		           if (t != NULL) {
                               while (t->sibling != NULL){ t = t->sibling; }
                               t->sibling = (yyvsp[0].treeNode);
                               (yyval.treeNode) = (yyvsp[-1].treeNode);
                           }
                           else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		         }
#line 2407 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 105:
#line 491 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2413 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 106:
#line 496 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[-1].treeNode); yyerrok; }
#line 2419 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 107:
#line 497 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 2425 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 108:
#line 501 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Undef, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2434 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 109:
#line 506 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2440 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 110:
#line 509 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-1].treeNode);
		  yyerrok;
		}
#line 2449 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 111:
#line 514 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode)=NULL; yyerrok; }
#line 2455 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 112:
#line 517 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-1].treeNode);
		  yyerrok;
		}
#line 2464 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 113:
#line 522 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode)=NULL; yyerrok;}
#line 2470 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 114:
#line 525 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2479 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 115:
#line 530 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2488 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 116:
#line 535 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2497 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 117:
#line 540 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, AssignK, Int, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData)); 
		  (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
		  (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
		}
#line 2506 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 118:
#line 544 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2512 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 119:
#line 545 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2518 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 120:
#line 549 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2530 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 121:
#line 557 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2536 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 122:
#line 559 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode)=NULL;}
#line 2542 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 123:
#line 564 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2554 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 124:
#line 571 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2560 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 125:
#line 573 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2566 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 126:
#line 578 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = newNode(ExpK, UnaryK, Bool, (yyvsp[-1].tokenData)->linenum, (yyvsp[-1].tokenData));
			 (yyval.treeNode)->child[0] = (yyvsp[0].treeNode);
			
			 if ((yyvsp[0].treeNode) != NULL && (yyvsp[0].treeNode)->isConstant) (yyval.treeNode)->isConstant = true;
			 else (yyval.treeNode)->isConstant = false;
			}
#line 2578 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 127:
#line 586 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2584 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 128:
#line 588 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2590 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 129:
#line 592 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2602 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 130:
#line 599 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2608 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 131:
#line 601 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2614 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 132:
#line 605 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2620 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 133:
#line 606 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2626 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 134:
#line 607 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2632 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 135:
#line 608 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2638 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 136:
#line 609 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2644 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 137:
#line 610 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)) ; }
#line 2650 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 138:
#line 614 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2662 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 139:
#line 622 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2668 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 140:
#line 624 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; yyerrok; }
#line 2674 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 141:
#line 627 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2680 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 142:
#line 628 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2686 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 143:
#line 632 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = (yyvsp[-1].treeNode);
			 (yyval.treeNode)->child[0] = (yyvsp[-2].treeNode);
			 (yyval.treeNode)->child[1] = (yyvsp[0].treeNode);
			 if ((yyvsp[-2].treeNode) != NULL && (yyvsp[0].treeNode) != NULL && (yyvsp[-2].treeNode)->isConstant && (yyvsp[-2].treeNode)->isConstant)
				(yyval.treeNode)->isConstant = true;
			}
#line 2698 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 144:
#line 640 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2704 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 145:
#line 642 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2710 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 146:
#line 645 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2716 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 147:
#line 646 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2722 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 148:
#line 647 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, OpK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2728 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 149:
#line 652 "c-.y" /* yacc.c:1646  */
    {
			 (yyval.treeNode) = (yyvsp[-1].treeNode);
			 for (int i = 0; i <= 2; i++)
				if ((yyval.treeNode)->child[i] == NULL){ (yyval.treeNode)->child[i] = (yyvsp[0].treeNode); break; }
			
			 if ((yyvsp[0].treeNode) != NULL && (yyvsp[0].treeNode)->isConstant) (yyval.treeNode)->isConstant = true;
			 else (yyval.treeNode)->isConstant = false;
		
			}
#line 2742 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 150:
#line 661 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2748 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 151:
#line 663 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2754 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 152:
#line 666 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, UnaryK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2760 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 153:
#line 667 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, UnaryK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2766 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 154:
#line 668 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, UnaryK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2772 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 155:
#line 672 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2778 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 156:
#line 672 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2784 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 157:
#line 675 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, IdK, Void, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData)); }
#line 2790 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 158:
#line 677 "c-.y" /* yacc.c:1646  */
    {
		 (yyval.treeNode) = newNode(ExpK, OpK, Undef, (yyvsp[-2].tokenData)->linenum, (yyvsp[-2].tokenData));
		 (yyval.treeNode)->child[0] = (yyvsp[-3].treeNode);

		 (yyvsp[-1].treeNode)->isIndex = true;
		 (yyval.treeNode)->child[1] = (yyvsp[-1].treeNode);
		}
#line 2802 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 159:
#line 686 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[-1].treeNode); yyerrok; }
#line 2808 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 160:
#line 687 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2814 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 161:
#line 688 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2820 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 162:
#line 690 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2826 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 163:
#line 696 "c-.y" /* yacc.c:1646  */
    {
		 if ((yyvsp[-1].treeNode) != NULL){
			(yyval.treeNode) = newNode(ExpK, CallK, (yyvsp[-1].treeNode)->nodetype, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
			(yyval.treeNode)->child[0] = (yyvsp[-1].treeNode);
		 }
		 else{
			(yyval.treeNode) = newNode(ExpK, CallK, Void, (yyvsp[-3].tokenData)->linenum, (yyvsp[-3].tokenData));
		 }
		}
#line 2840 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 164:
#line 710 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2846 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 165:
#line 711 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = NULL; }
#line 2852 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 166:
#line 716 "c-.y" /* yacc.c:1646  */
    { TreeNode *t = (yyvsp[-2].treeNode);
	           if (t != NULL) {
                       while (t->sibling != NULL){ t = t->sibling; }
                       t->sibling = (yyvsp[0].treeNode);
                       (yyval.treeNode) = (yyvsp[-2].treeNode);
                   }
                   else { (yyval.treeNode) = (yyvsp[0].treeNode);}
		yyerrok;
	        }
#line 2866 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 167:
#line 725 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = (yyvsp[0].treeNode); }
#line 2872 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 168:
#line 732 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, ConstK, Int, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData));
                   (yyval.treeNode)->isConstant = true;
                 }
#line 2880 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 169:
#line 736 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, ConstK, Bool, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData));
		  (yyval.treeNode)->isConstant = true;
		}
#line 2888 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 170:
#line 740 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, ConstK, Char, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData));
		  (yyval.treeNode)->isConstant = true;
		}
#line 2896 "c-.tab.c" /* yacc.c:1646  */
    break;

  case 171:
#line 744 "c-.y" /* yacc.c:1646  */
    { (yyval.treeNode) = newNode(ExpK, ConstK, Char, (yyvsp[0].tokenData)->linenum, (yyvsp[0].tokenData));
		  (yyval.treeNode)->isConstant = true;
		  (yyval.treeNode)->isArray = true;
		}
#line 2905 "c-.tab.c" /* yacc.c:1646  */
    break;


#line 2909 "c-.tab.c" /* yacc.c:1646  */
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
#line 752 "c-.y" /* yacc.c:1906  */


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
    	bool *hasReturn = new bool();


	*hasReturn = false;	
	*numErrors = 0;
	*numWarnings = 0;


	std::vector<std::string> *symbolNames = new std::vector<std::string>;
	std::vector<std::string> *symbolStack = new std::vector<std::string>;
	//std::vector<std::string> *namesWarned = new std::vector<std::string>;

	initErrorProcessing();

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

	std::string out1Str{"output"};
	TokenData *out1 = new TokenData;
	out1->tokenstr = const_cast<char*>(out1Str.c_str());
	out1->strValue = const_cast<char*>(out1Str.c_str());
	out1->linenum = -1;

	std::string out2Str{"outputb"};
	TokenData *out2 = new TokenData;
	out2->tokenstr = const_cast<char*>(out2Str.c_str());
	out2->strValue = const_cast<char*>(out2Str.c_str());
	out2->linenum = -1;

	std::string out3Str{"outputc"};
	TokenData *out3 = new TokenData;
	out3->tokenstr = const_cast<char*>(out3Str.c_str());
	out3->strValue = const_cast<char*>(out3Str.c_str());
	out3->linenum = -1;

	std::string out4Str{"outnl"};
	TokenData *out4 = new TokenData;
	out4->tokenstr = const_cast<char*>(out4Str.c_str());
	out4->strValue = const_cast<char*>(out4Str.c_str());
	out4->linenum = -1;

	std::string in1Str{"input"};
	TokenData *in1 = new TokenData;
	in1->tokenstr = const_cast<char*>(in1Str.c_str());
	in1->strValue = const_cast<char*>(in1Str.c_str());
	in1->linenum = -1;

	std::string in2Str{"inputb"};
	TokenData *in2 = new TokenData;
	in2->tokenstr = const_cast<char*>(in2Str.c_str());
	in2->strValue = const_cast<char*>(in2Str.c_str());
	in2->linenum = -1;

	std::string in3Str{"inputc"};
	TokenData *in3 = new TokenData;
	in3->tokenstr = const_cast<char*>(in3Str.c_str());
	in3->strValue = const_cast<char*>(in3Str.c_str());
	in3->linenum = -1;

	std::string dummyStr{"dummy"};
	TokenData *dummy = new TokenData;
	dummy->tokenstr = const_cast<char*>(dummyStr.c_str());
	dummy->strValue = const_cast<char*>(dummyStr.c_str());
	dummy->linenum = -1;

	TreeNode *dummyInt = newNode(DeclK, ParamK, Int, -1, dummy);
	TreeNode *outputNode = newNode(DeclK, FunK, Void, -1, out1);
	outputNode->child[0] = dummyInt;

	TreeNode *dummyBool = newNode(DeclK, ParamK, Bool, -1, dummy);
	TreeNode *outputbNode = newNode(DeclK, FunK, Void, -1, out2);
	outputbNode->child[0] = dummyBool;

	TreeNode *dummyChar = newNode(DeclK, ParamK, Char, -1, dummy);
	TreeNode *outputcNode = newNode(DeclK, FunK, Void, -1, out3);
	outputcNode->child[0] = dummyChar;

	TreeNode *outputnlNode = newNode(DeclK, FunK, Void, -1, out4);

	TreeNode *inputNode = newNode(DeclK, FunK, Int, -1, in1);

	TreeNode *inputbNode = newNode(DeclK, FunK, Bool, -1, in2);

	TreeNode *inputcNode = newNode(DeclK, FunK, Char, -1, in3);

	

	

            if ((yyin = fopen(argv[optCount], "r"))){
		yyparse();   // call the parse
		if (printFlag) printTree(savedTree, 0, -1, false, false, "", false);
		SymbolTable st = SymbolTable();

		st.insert(out1Str, outputNode);
		st.insert(out2Str, outputbNode);
		st.insert(out3Str, outputcNode);
		st.insert(out4Str, outputnlNode);
		st.insert(in1Str, inputNode);
		st.insert(in2Str, inputbNode);
		st.insert(in3Str, inputcNode);

		//printf("MADE IT TO SCOPE\n");

		scopeAndType(savedTree, numErrors, numWarnings, st, symbolNames, symbolStack, 0, NULL, hasReturn);

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

		st.insert(out1Str, outputNode);
		st.insert(out2Str, outputbNode);
		st.insert(out3Str, outputcNode);
		st.insert(out4Str, outputnlNode);
		st.insert(in1Str, inputNode);
		st.insert(in2Str, inputbNode);
		st.insert(in3Str, inputcNode);

		//printf("MADE IT TO SCOPE\n");
		scopeAndType(savedTree, numErrors, numWarnings, st, symbolNames, symbolStack, 0, NULL, hasReturn);

		checkUseSymbolTable(st, symbolNames, numErrors, numWarnings);

		if (printTypes){
			 printTree(savedTree, 0, -1, false, false, "", true);

		}

            }

	    *numErrors += syntax_error;
	    *numWarnings += syntax_warning;

	    printf("Number of warnings: %d\n", *numWarnings);
	    printf("Number of errors: %d\n", *numErrors);

        }

	

	return 0;
}

