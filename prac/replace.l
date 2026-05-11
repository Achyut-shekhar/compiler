%{
   #include<stdio.h>  
%}
%%
[a] {fprintf(yyout,"%c",'z');}
[e] {fprintf(yyout,"%c",'q');}
.|\n {fprintf(yyout,"%c",yytext[0]);}
%%
int yywrap(){
  return 1;
}
int main(){
  yyin=fopen("input.txt","r");
  yyout=fopen("output.txt","w");
  yylex();
}