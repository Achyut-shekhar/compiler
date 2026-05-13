%{
  #include<stdio.h>
%}
%%
"//".* {fprintf(yyout,"comment: %s",yytext);}
[\t]+  ;
.|\n   {fprintf(yyout,"%s",yytext);}
%%
int yywrap(){
 
 return 1;
}

int main(){
   yyin=fopen("input.c","r");
  yyout=fopen("output.c","w");
  yylex();
}