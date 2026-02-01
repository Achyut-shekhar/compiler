%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { printf("Found Valid Identifier: %s\n", yytext); }
.|\n            { /* Ignore everything else */ }
%%

int main() {
    printf("Enter text to extract identifiers (Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}