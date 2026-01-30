%{
#include <stdio.h>
#include <string.h>

int is_keyword(char *str) {
    char *keywords[] = {"int", "float", "return", "if", "else", "while", "main", NULL};
    for(int i = 0; keywords[i] != NULL; i++) {
        if(strcmp(str, keywords[i]) == 0) return 1;
    }
    return 0;
}
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    if (is_keyword(yytext))
        fprintf(yyout, "KEYWORD: %s\n", yytext);
    else
        fprintf(yyout, "IDENTIFIER: %s\n", yytext);
}

[0-9]+\.[0-9]+            { fprintf(yyout, "NUMBER: %s\n", yytext); }
[0-9]+                    { fprintf(yyout, "NUMBER: %s\n", yytext); }

"=="|"<="|">="|"++"      { fprintf(yyout, "OPERATOR: %s\n", yytext); }
[+\-*/=<>]                { fprintf(yyout, "OPERATOR: %s\n", yytext); }

[;,(){}]                  { fprintf(yyout, "SEPARATOR: %s\n", yytext); }

[ \t\n\r]+                { /* skip whitespace */ }

.                         { fprintf(yyout, "UNKNOWN: %s\n", yytext); }
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("index.html", "r");
    if (!yyin) {
        printf("Error: index.html not found\n");
        return 1;
    }

    yyout = fopen("output.txt", "w");
    if (!yyout) {
        printf("Error: output.txt could not be created\n");
        return 1;
    }

    yylex();
    
    fclose(yyin);
    fclose(yyout);
    printf("Lexical analysis complete. Check output.txt\n");
    return 0;
}