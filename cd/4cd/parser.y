%{
#include <stdio.h>
#include <stdlib.h>
int flag = 0;
void yyerror(const char *s);
%}

%token ONE ZERO NL

%%

// Grammar rules
str1:
    str2 n1 { }
;

str2:
    ZERO str2 ONE { }
  | ZERO ONE { }
;

n1:
    NL { 
        if (flag == 0) {
            printf("\nThe string is accepted.\n");
        }
        return 0; 
    }
;

// Catch-all for any invalid patterns
%%
int main() {
    printf("Enter string (any combination of 0 and 1):\n");
    yyparse();
    if (flag == 0) {
        printf("\nThe string is valid for L=[0^n1^n].\n");
    }
    return 0;
}

void yyerror(const char *s) {
    printf("\nEntered arithmetic is invalid for L=[0^n1^n]: %s\n\n", s);
    flag = 1;
}

