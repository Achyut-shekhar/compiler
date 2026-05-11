%{
#include <stdio.h>
%}

%%
[a-zA-Z0-9]*cd[a-zA-Z0-9]*   { printf("Word containing cd: %s\n", yytext); }
[ \t\n]+                     ;
.                            ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a string: ");
    yylex();
    return 0;
}