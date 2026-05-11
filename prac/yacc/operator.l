%{
  #include "y.tab.h"
%}
%%
[0-9]+ {yylval=atoi(yytext);return NUMBER;}
\n {return NL;}
"+"   {return '+';}
"-"    {return '-';}
"/"    {return '/';}
"%"    {return '%';}
"("     {return '(';}
")"     {return ')';}
.    {printf("invalid char");exit(0);}
%%
int yywrap(){
  return 1;
}