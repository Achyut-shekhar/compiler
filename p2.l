%{
    #include<stdio.h>
%}
%%
[_a-zA-Z][_a-zA-Z0-9]* {printf("Valid Identifier\n");}
[0-9][_a-zA-Z0-9]* {printf("Invalid Identifier\n");}
[^ \t\n]+ {printf("Invalid Identifier\n");}
\n {;}
%%
int yywrap()
{
    return 1;
}
int main()
{
    printf("Enter Input: ");
    yylex();
    return 0;
}
