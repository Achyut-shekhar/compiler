/* 
Design a LEX Code to extract all html tags in the HTML file given at run time and store intotext file given at run time.
*/

%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
"<"[^>]+">"    { fprintf(yyout, "%s\n", yytext); }
.|\n           { ; }
%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("index.html", "r");
    if (!yyin) {
        printf("Error: index.html not found\n");
        return 1;
    }

    yyout = fopen("output.txt", "w");
    if (!yyout) {
        printf("Error: Could not create output.txt\n");
        fclose(yyin);
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("Success! Tags extracted to output.txt\n");
    return 0;
}