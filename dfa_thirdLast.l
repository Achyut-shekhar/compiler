%{
#include <stdio.h>
%}

%%
.*a..\n     { printf("ACCEPTED: %s", yytext); }
.+\n        { printf("REJECTED: %s", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("DFA to check if third last character is 'a'\n");
    printf("Enter strings (Ctrl+D or Ctrl+Z to exit):\n");
    yylex();
    return 0;
}
