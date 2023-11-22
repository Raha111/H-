%{
    #include<bits/stdc++.h>
    using namespace std;
    #include "1907111.tab.h"

%}

%option noyywrap


ID	[a-z][_a-z0-9]*

%%

"<import>".*"</import>" { return IMPORT; }
"<com>".* { return SCOM; }
"<mcom>"([^*]|[*]+)*"</mcom>" { return MCOM; }
[\n]* { }
"<main>" { return MAINO; }
"</main>" { return MAINC; }
"<i>" { return INTO; }
"</i>" { return INTC; }
"<f>" { return FLOATO; }
"</f>" { return FLOATC; }
"<d>" { return DUBO; }
"</d>" { return DUBC; }
"<c>" { return CHARO; }
"</c>" { return CHARC; }
"<s>" { return STRO; }
"</s>" { return STRC; }
"<=>" { return EQUAL; }
"<+>" { return PLUS; }
"<->" { return MINUS; }
"<*>" { return MUL; }
"</>" { return DIV; }
"<%>" { return MOD; }
"(" { return LP; }
")" { return RP; }

"<pow>" { return POW; }
"<++>" { return INC; }
"<-->" { return DEC; }
"<<>" { return LT; }
"<<=>" { return LE; }
"<>>" { return GT; }
"<>=>" { return GE; }
"<!=>" { return NE; }

";"   { return(*yytext); }
","   { return(*yytext); }
"["   { return(*yytext); }
"]"   { return(*yytext); }

"func" { return FUNCKEY; }
"<const>" { return CONST; }

{ID} { yylval.str= strdup(yytext); return VAR; }

[0-9]*\.[0-9]+"f"? {
    yylval.floatValue = atof(yytext);
 return FLOAT;
}
[0-9]+ { 
 yylval.intValue = atoi(yytext);
 return INTEGER;
}
[0-9]*\.[0-9]+(e[+-]?[0-9]+)?("f")? {
    yylval.floatValue = atof(yytext);
    return DOUBLE;
}

'.' {
    // Process single character
    yylval.charValue = yytext[1];
    return CHAR;
}

\"([^\"\\]|\\.)*\" {
    // Process string (including escape characters)
    yylval.str = strdup(yytext);
    return STRING;
}

"<print>"		{return PRINT;}
"</print>"		{return ENDPRINT;}
"<root>"		{ return ROOT;}
"</root>"		{ return ENDROOT;}
"<for>" 		{ return FOR;}
"</for>"		{ return ENDFOR;}
"<count>"	    { return COUNT;}
"</count>"		{ return ENDCOUNT;}

"<condition>"	{ return CONDITION;}
"</condition>"	{ return ENDCONDITION;}
"<true>"			{ return IF;}
"</true>"			{ return ENDIF;}
"<false>"		{ return ELSE;}
"</false>"		{ return ENDELSE;}

"<while>" { return WHILE; }
"</while>" { return ENDWHILE; }
"<do>" { return DO; }
"</do>" { return ENDDO; }
"<fun>" { return FUN; }
"</fun>" { return ENDFUN; }

"<sin>"			{ return SIN;}
"</sin>"		{ return ENDSIN;}
"<cos>"			{ return COS;}
"</cos>"		{ return ENDCOS;}
"<tan>"			{ return TAN;}
"</tan>"		{ return ENDTAN;}

[ ]*	    	{}
[\t]*			{}

%%


