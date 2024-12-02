%{
#include <stdio.h>
#include <stdlib.h>

int yylex(); // Declare the yylex function
int flag = 0; // To track if the expression is valid
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
// Grammar rules
ArithmeticExpression: E {
    printf("\nResult = %d\n", $1);
    return 0;
}
;

E: E '+' E { $$ = $1 + $3; }
 | E '-' E { $$ = $1 - $3; }
 | E '*' E { $$ = $1 * $3; }
 | E '/' E { $$ = $1 / $3; }
 | E '%' E { $$ = $1 % $3; }
 | '(' E ')' { $$ = $2; }
 | NUMBER { $$ = $1; }
 ;

%%

// Driver code
int main() {
    printf("Enter any arithmetic expression:\n");
    yyparse();
    if (flag == 0)
        printf("\nEntered arithmetic expression is Valid\n\n");
    return 0;
}

void yyerror(const char *s) {
    printf("\nEntered arithmetic expression is Invalid: %s\n\n", s);
    flag = 1;
}

