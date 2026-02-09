%{
#include <stdio.h>
#include <string.h>

int count_zeros = 0;
int count_ones = 0;
%}

/* DFA for accepting even number of 0s and even number of 1s */
%%

[01]+       { 
                // Reset counters
                count_zeros = 0;
                count_ones = 0;
                
                // Count 0s and 1s in the input string
                for (int i = 0; i < strlen(yytext); i++) {
                    if (yytext[i] == '0') {
                        count_zeros++;
                    } else if (yytext[i] == '1') {
                        count_ones++;
                    }
                }
                
                // Check if both counts are even
                if (count_zeros % 2 == 0 && count_ones % 2 == 0) {
                    printf("ACCEPTED: %s (zeros=%d, ones=%d)\n", yytext, count_zeros, count_ones);
                } else {
                    printf("REJECTED: %s (zeros=%d, ones=%d)\n", yytext, count_zeros, count_ones);
                }
            }

[ \t\n\r]+    ;  /* Skip whitespace */

.           { printf("ERROR: Invalid character '%s'\n", yytext); }

%%

int main() {
    printf("DFA - Accepts strings with even 0s and even 1s\n");
    printf("Enter binary strings (0s and 1s only):\n\n");
    
    yylex();
    
    return 0;
}

int yywrap() {
    return 1;
}
