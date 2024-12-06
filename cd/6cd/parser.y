%{
#include <stdio.h>
void yyerror(const char *s);
int yylex();
%}

%token ZERO ONE NL
%start q0

%%
q0: ZERO q0 { /* Stay in q0 for 0 */ }
   | ONE q1 { /* Transition to q1 for 1 */ }
   | ZERO q0 ZERO { /* Handle consecutive 0s */ }
   | ZERO q0 ONE { /* Handle 0 followed by 1 */ }
   | ONE q1 ZERO { /* Handle 1 followed by 0 */ }
   | ONE q1 ONE { /* Handle consecutive 1s */ }
   | NL { printf("Number is divisible by 3\n"); }
   ;

q1: ZERO q1 { /* Transition back to q0 for 0 */ }
   | ONE q2 { /* Transition to q2 for 1 */ }
   | ZERO q1 ZERO { /* Handle consecutive 0s */ }
   | ZERO q1 ONE { /* Handle 0 followed by 1 */ }
   | ONE q2 ZERO { /* Handle 1 followed by 0 */ }
   | ONE q2 ONE { /* Handle consecutive 1s */ }
   | NL { printf("Number is not divisible by 3, remainder is 1\n"); }
   ;

q2: ZERO q2 { /* Stay in q2 for 0 */ }
   | ONE q0 { /* Transition back to q0 for 1 */ }
   | ZERO q2 ZERO { /* Handle consecutive 0s */ }
   | ZERO q2 ONE { /* Handle 0 followed by 1 */ }
   | ONE q0 ZERO { /* Handle 1 followed by 0 */ }
   | ONE q0 ONE { /* Handle consecutive 1s */ }
   | NL { printf("Number is not divisible by 3, remainder is 2\n"); }
   ;
%% 

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("\nEnter a decimal number to check its divisibility by 3:\n");
    yyparse();
    return 0;
}

