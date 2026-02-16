%{
#include <stdio.h>
%}

%%

"int"|"float"|"while"|"if"|"else"    { printf("KEYWORD: %s\n", yytext); }

[0-9]*"."[0-9]+                     { printf("FLOAT_LITERAL: %s\n", yytext); }

[0-9]+                              { printf("INT_LITERAL: %s\n", yytext); }


[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER: %s\n", yytext); }


"+"|"-"|"*"|"/"|"="|"<="|">="|"=="|"++"  { printf("OPERATOR: %s\n", yytext); }


";"|","|"("|")"|"{"|"}"             { printf("SEPARATOR: %s\n", yytext); }


[ \t\n]+                            ;


.                                   { printf("UNKNOWN: %s\n", yytext); }
%%

int main() {
    FILE *file = fopen("input.txt", "r");
    if (!file) {
        printf("Error: Cannot open input.txt\n");
        return 1;
    }
    yyin = file;
    printf("Processing input from input.txt...\n\n");
    yylex();
    fclose(file);
    return 0;
}

int yywrap() {
    return 1;
}