
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IMPORT = 258,
     SCOM = 259,
     MCOM = 260,
     MAINO = 261,
     MAINC = 262,
     INTO = 263,
     INTC = 264,
     FLOATO = 265,
     FLOATC = 266,
     DUBO = 267,
     DUBC = 268,
     CHARO = 269,
     CHARC = 270,
     STRO = 271,
     STRC = 272,
     EQUAL = 273,
     STMNT = 274,
     PLUS = 275,
     MINUS = 276,
     MUL = 277,
     DIV = 278,
     LP = 279,
     RP = 280,
     PRINT = 281,
     ENDPRINT = 282,
     ROOT = 283,
     ENDROOT = 284,
     FOR = 285,
     ENDFOR = 286,
     COUNT = 287,
     ENDCOUNT = 288,
     CONDITION = 289,
     ENDCONDITION = 290,
     IF = 291,
     ENDIF = 292,
     ELSE = 293,
     ENDELSE = 294,
     MOD = 295,
     POW = 296,
     INC = 297,
     DEC = 298,
     LT = 299,
     LE = 300,
     GT = 301,
     GE = 302,
     NE = 303,
     WHILE = 304,
     ENDWHILE = 305,
     DO = 306,
     ENDDO = 307,
     FUN = 308,
     ENDFUN = 309,
     FUNCKEY = 310,
     CONST = 311,
     SIN = 312,
     ENDSIN = 313,
     COS = 314,
     ENDCOS = 315,
     TAN = 316,
     ENDTAN = 317,
     VAR = 318,
     FLOAT = 319,
     INTEGER = 320,
     DOUBLE = 321,
     CHAR = 322,
     STRING = 323,
     IFX = 324
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 18 "1907111.y"

    int intValue;
    float floatValue;
    char* str;
    char charValue;



/* Line 1676 of yacc.c  */
#line 130 "1907111.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


