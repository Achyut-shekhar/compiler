/*5. Design a LEX Code to count and print the total number of characters, words, white spaces and
lines in a given file named as ‘Input.txt’.*/

%{
#include <stdio.h>
int char_count = 0, word_count = 0, space_count = 0, line_count = 0;
%}

%%
[ \t]      { char_count++; space_count++; }
\n         { char_count++; line_count++; space_count++; }
[A-Za-z0-9]+ { char_count += yyleng; word_count++; }
.          { char_count++; }
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("Input.txt", "r");
    if (!yyin) {
        printf("Error: Could not open Input.txt\n");
        return 1;
    }
    yylex();
    fclose(yyin);
    printf("Total characters: %d\n", char_count);
    printf("Total words: %d\n", word_count);
    printf("Total white spaces: %d\n", space_count);
    printf("Total lines: %d\n", line_count);
    return 0;
}
