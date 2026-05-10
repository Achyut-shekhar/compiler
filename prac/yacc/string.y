%{
  #include<stdio.h>
  #include<stdlib.h>

  void yyerror(const char *s);
  int yylex();
  %}

  %token A B

%%
S: A S B
| A B
;
%%

void yyerror(const char *s){
  printf("invalid string");
}

int main(){
  printf("enter the string");

  if(yyparse()==0)
        printf("Valid String\n");

    return 0;
}
