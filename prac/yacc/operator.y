%{
  #include<stdio.h>
  #include<stdlib.h>
  int yyerror(char *s);
  int yylex(void);
%}
%token NUMBER NL
%left "+" "-"
%left "*" "/" "%"
%%
stmt:exp NL {printf("valid result= %d",$1);exit(0);}
exp: exp '+' exp {$$=$1+$3;}
|exp '-' exp {$$=$1-$3;}
|exp '*' exp {$$=$1*$3;}
|exp '/' exp {
      if($3==0){
        printf("cant be zero");
        exit(0);
      }else{
        $$=$1/$3;
      }
}
|exp '%' exp {
      if($3==0){
        printf("cant be zero");
        exit(0);
      }else{
        $$=$1%$3;
      }
}
|'('exp')'{$$=$2;}
|NUMBER {$$=$1;}
;
%%
int yyerror(char *s){
  printf("invalid");
  exit(0);

}
int main(){
  printf("input the operator");
  yyparse();
  return 0;
}