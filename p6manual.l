/* write a lex program to replace white spaces with single blank space take input from file and store output in a output.txt file */

%{
#include <stdio.h>
%}

%%

[ \t\n\r]+    { fprintf(yyout, " "); }
.             { fprintf(yyout, "%s", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    // Open the input file for reading
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        printf("Error: Could not open input.txt\n");
        return 1;
    }

    // Open the output file for writing
    yyout = fopen("output.txt", "w");
    if (!yyout) {
        printf("Error: Could not open output.txt\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);
    
    printf("Processing complete. Check output.txt\n");
    return 0;
}
