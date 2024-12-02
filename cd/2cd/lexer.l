%{
#include <stdio.h>
#include <stdlib.h>
%}

Binary    [0-1]+
Oct       [0-7]+
Dec       [0-9]+
Hex       [0-9A-Fa-f]+
Float     [-+]?[0-9]*\.[0-9]+
Exponent  [-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?

%%

{Binary}   { printf("This is a binary number: %s\n", yytext); }
{Oct}      { printf("This is an octal number: %s\n", yytext); }
{Dec}      { printf("This is a decimal number: %s\n", yytext); }
{Hex}      { printf("This is a hexadecimal number: %s\n", yytext); }
{Float}    { printf("This is a float number: %s\n", yytext); }
{Exponent} { printf("This is an exponent number: %s\n", yytext); }
.|\n      { }

%%

int main()
{
    printf("Enter numbers (end with Ctrl+D or Ctrl+Z):\n");
    yylex();
    return 0;
}

