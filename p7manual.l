%{
  #include<stdio.h>
  
%}
%%
"//".*            { fprintf(yyout, "COMMENT: %s\n", yytext); }
"/*"(.|\n)*"*/"   { fprintf(yyout, "COMMENT: %s\n", yytext); }

%%

int main(){
  yyin = fopen("input.c", "r");
  if (!yyin) {
    printf("Error: Could not open input.c\n");
    return 1;
  }
  yyout = fopen("output.c", "w");
  if (!yyout) {
    printf("Error: Could not open output.c\n");
    fclose(yyin);
    return 1;
  }
  yylex();
  fclose(yyin);
  fclose(yyout);
  printf("Processing complete. Comments written to output.c\n");
  return 0;
}

int yywrap(){
  return 1;

}