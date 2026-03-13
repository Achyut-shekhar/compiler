%{
  #include<stdio.h>
%}
%%
"<!--"(.|\n)*"-->" {fprintf(yyout,"%s",yytext);}
.|\n      {;}
%%
int yywrap(){
  return 1;
}
int main(){
  yyin=fopen("input.html","r");
  yyout=fopen("ouput.txt","w");
  yylex();
}