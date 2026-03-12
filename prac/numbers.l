%{
  #include<stdio.h>
%}
%%
[0-9] {;}
.|\n    {fprintf(yyout,"%s",yytext);}

%%
int yywrap(){
  return 1;
}

int main(){
  yyin=fopen("input.txt","r");
  yyout=fopen("output.txt","w");
  yylex();
}