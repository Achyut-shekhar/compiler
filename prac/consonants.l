%{
  #include<stdio.h>
%}
%%
[^aeiou0-9] {fprintf(yyout,"%s"," ");}
.|\n     {fprintf(yyout,"%s",yytext);}
%%
int yywrap(){
  return 1;
}
int main(){
  yyin=fopen("input.txt","r");
  yyout=fopen("ouput.txt","w");
  yylex();
}