%{
#include <stdio.h>
extern FILE *yyin;
%}

/* Pattern that matches strings ending with "10" */
%%

[01]*10     { printf("ACCEPTED: %s (ends with 10)\n", yytext); }

[01]+       { printf("REJECTED: %s (does not end with 10)\n", yytext); }

[ \t\n\r]+    ;  /* Skip whitespace */

.           { printf(" ERROR: Invalid character %s\n", yytext); }

%%

int main() {
    yyin = fopen("dfa_test.txt", "r");
    if (!yyin) {
        printf("Error: Could not open input.txt\n");
        return 1;
    }

    printf("DFA in Lex - Accepts binary strings ending with '10'\n");
    printf("Reading input from input.txt...\n\n");

    yylex();

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}
