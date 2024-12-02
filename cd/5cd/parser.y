%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();  // Declare yylex
void yyerror(const char *s); // Declare yyerror
FILE *fpOut;  // Declare fpOut globally

%}

%union {
    char vname[32];  // Variable names
    int num;         // Numeric values
}

%token <vname> NAME
%token <num> NUMBER
%type <vname> expression

%left '+' '-'
%left '*' '/'

%%
input: line '\n' input
     | '\n' input
     | ;

line: NAME '=' expression {
    fprintf(fpOut, "MOV %s, AX\n", $1);
}
;

expression: expression '+' expression {
    fprintf(fpOut, "ADD AX, %s\n", $3);
}
| expression '-' expression {
    fprintf(fpOut, "SUB AX, %s\n", $3);
}
| expression '*' expression {
    fprintf(fpOut, "MUL AX, %s\n", $3);
}
| expression '/' expression {
    fprintf(fpOut, "DIV AX, %s\n", $3);
}
| NAME {
    fprintf(fpOut, "MOV AX, %s\n", $1);
}
| NUMBER {
    fprintf(fpOut, "MOV AX, %d\n", $1);
}
;

%%

// Error handling function
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

