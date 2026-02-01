%{
   #include<stdio.h>
   
%}

%%
[0-9]+"."[0-9]+  {printf("float value %s",yytext);}
[0-9]+            {printf("integer value %s",yytext);}
%%

int main(){
  printf("enter the input");
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}