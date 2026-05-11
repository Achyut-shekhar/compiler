%{
  #include<stdio.h>
  #include<stdlib.h>
  int yylex(void);
  int yyerror(const char *s);
%}
%token A B nl
%%
stmt: s nl {printf("valid string"); exit(0);}
s:A s B
|A B
;
%%
int yyerror(const char *s){
  printf("invalid string");
  exit(0);
}
int main(){
  printf("input the string");
  yyparse();
}
