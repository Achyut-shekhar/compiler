%{
  #include<stdio.h>
  #include<stdlib.h>
  int yyerror(char *s);
  int yylex(void);
%}
%token A B NL
%%
stmt:S NL {printf("valid");exit(0);}
S:A A A S B
|A A A B
;
%%
int yyerror(char *s){
  printf("invalid");
  exit(0);
}
int main(){
  printf("input the string");
  yyparse();
  return 0;
}