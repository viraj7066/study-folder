%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"  // Include Yacc header for token definitions

FILE *fpOut;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {  // Variable names
    strcpy(yylval.vname, yytext);
    return NAME;
}
[0-9]+           {  // Numbers
    yylval.num = atoi(yytext);
    return NUMBER;
}
[ \t]+           ;  // Ignore whitespace
\n               { return '\n'; }
"="              { return '='; }
"+"              { return '+'; }
"-"              { return '-'; }
"*"              { return '*'; }
"/"              { return '/'; }
.                { return yytext[0]; }  // Return single characters
%%

// Declare the input file
FILE *yyin;

int main() {
    FILE *fpInput;
    fpInput = fopen("input.txt", "r");
    fpOut = fopen("output.asm", "w");
    yyin = fpInput;
    yyparse();
    fclose(fpInput);
    fclose(fpOut);
    return 0;
}

