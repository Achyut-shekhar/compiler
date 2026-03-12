%{
  #include<stdio.h>
%}
%%
[a-z] {fprintf(yyout,"%c",yytext[0]-32);}
[A-Z] {fprintf(yyout,"%c",yytext[0]+32);}
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