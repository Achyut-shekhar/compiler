%{
#include <stdio.h>

int vowels = 0, consonants = 0, digits = 0, spaces = 0;
%}

%%
[aeiouAEIOU]     { vowels++; }
[0-9]            { digits++; }
[ \t\n]          { spaces++; }
[a-zA-Z]         { consonants++; }
.                { /* ignore other characters */ }
%%

int main() {
    yylex();
    printf("Vowels: %d\n", vowels);
    printf("Consonants: %d\n", consonants);
    printf("Digits: %d\n", digits);
    printf("Spaces: %d\n", spaces);
    return 0;
}

int yywrap() {
    return 1;
}
