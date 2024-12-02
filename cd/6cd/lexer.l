%{
#include "parser.tab.h"
%}
%%
[01]      { return yytext[0] - '0'; } // Return 0 or 1 as token
[\n]      { return NL; }
[ \t]     ;  // Ignore spaces and tabs
.         { /* Ignore any other character */ }
%%

