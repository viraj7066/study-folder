%{
#include "parser.tab.h"
int yylex();
%}

%%

"0"      { return ZERO; }
"1"      { return ONE; }
[\n]     { return NL; }
[ \t]+   ;
.        { }

%%

int yywrap() {
    return 1;
}

