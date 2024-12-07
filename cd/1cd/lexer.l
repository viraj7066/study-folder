%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
%}

digit                [0-9]
letter               [a-zA-Z]
identifier           {letter}({letter}|{digit}|_)
keyword              "int"|"float"|"char"|"void"|"if"|"else"|"for"|"while"|"return"
operator             "+"|"-"|"*"|"/"|"="|"=="|"!="|"<"|">"|"<="|">="
separator            ";"|","|"\("|\)|"\{"|"\}"
comment              "//".*|"/\*[^*]*\*+([^/*][^*]*\*+/)?"
whitespace           [ \t]+
newline              \n
string               \"([^\\\"\n]|\\.)*\"

%% 

{identifier}        { printf("ID: %s\n", yytext); }
{keyword}           { printf("KEYWORD: %s\n", yytext); }
{digit}            { printf("NUMBER: %s\n", yytext); }
{operator}          { printf("OPERATOR: %s\n", yytext); }
{separator}         { printf("SEPARATOR: %s\n", yytext); }
{comment}           { /* Ignore comments */ }
{whitespace}        { /* Ignore whitespace */ }
{newline}           { printf("NEW LINE\n"); }
{string}            { printf("STRING: %s\n", yytext); }
.                   { printf("ERROR: Unrecognized character: %s\n", yytext); }

%% 

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter your C code (end with Ctrl+D):\n");
    yylex(); // Call the lexer
    return 0;
}

