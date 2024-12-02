%{
#include "parser.tab.h"  // Ensure this is included to define tokens
#include <stdio.h>
#include <stdlib.h>
extern int yylval; // Declare yylval for the parser
%}

%%
[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}
[\t]+ ; // Ignore whitespace
\n { return 0; } // Handle new lines
. { return yytext[0]; } // Return single characters
%%

int yywrap() {
    return 1;
}

