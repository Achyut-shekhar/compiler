%{
#include <stdio.h>
#include <string.h>

/*
State Diagram:
q0: Initial state (haven't seen "11" yet)
q1: Last char is '1' (haven't seen "11" yet)
q2: Seen "11", but doesn't end with '1' or "10"
q3: Seen "11", last char is '1'
q4: Seen "11" AND ends with "10" (ACCEPTING STATE)

Transitions:
q0 --0--> q0
q0 --1--> q1
q1 --0--> q0
q1 --1--> q3 (found "11")
q2 --0--> q2
q2 --1--> q3
q3 --0--> q4 (ends with "10")
q3 --1--> q3
q4 --0--> q2 (ends with "00")
q4 --1--> q3 (ends with "01")
*/

int state;
%}

%%

[01]+       {
                state = 0; // Start at q0
                
                printf("Processing: %s\n", yytext);
                printf("Transitions: q0");
                
                for (int i = 0; i < strlen(yytext); i++) {
                    char ch = yytext[i];
                    
                    if (state == 0) {
                        if (ch == '0') state = 0;
                        else if (ch == '1') state = 1;
                    }
                    else if (state == 1) {
                        if (ch == '0') state = 0;
                        else if (ch == '1') state = 3; // Found "11"
                    }
                    else if (state == 2) {
                        if (ch == '0') state = 2;
                        else if (ch == '1') state = 3;
                    }
                    else if (state == 3) {
                        if (ch == '0') state = 4; // Ends with "10"
                        else if (ch == '1') state = 3;
                    }
                    else if (state == 4) {
                        if (ch == '0') state = 2;
                        else if (ch == '1') state = 3;
                    }
                    
                    printf(" --%c--> q%d", ch, state);
                }
                
                printf("\n");
                
                if (state == 4) {
                    printf("✓ ACCEPTED: Contains '11' and ends with '10'\n\n");
                } else {
                    printf("✗ REJECTED: Final state q%d (need q4)\n\n", state);
                }
            }

[ \t\n\r]+ ; /* Skip whitespace */

.           { printf("ERROR: Invalid character '%s'\n", yytext); }

%%

int main() {
    printf("DFA - Accepts strings containing '11' AND ending with '10'\n");
    printf("Enter binary strings:\n\n");
    
    yylex();
    
    return 0;
}

int yywrap() {
    return 1;
}