%{
/* Lex program to print alternate characters of the given input */
int count = 0;
%}

%%
.   { 
        count++;
        if(count % 2 == 1) {
            printf("%c", yytext[0]);
        }
    }
\n  { 
        printf("\n");
        count = 0;
    }
%%

int yywrap() {
    return 1;   
}

int main() {
    printf("Enter input: ");
    yylex();
    return 0;
}
