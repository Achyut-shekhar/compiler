%{
   #include<stdio.h>
%}
%s A DEAD
%%
<INITIAL>0 BEGIN A;
<INITIAL>1 BEGIN INITIAL;
<INITIAL>[^O1\n] BEGIN DEAD;
<INITIAL>\n {BEGIN INITIAL;printf("string not accepted");}
<A>0 BEGIN A;
<A>1 BEGIN A;
<A>[^O1\n] BEGIN DEAD;
<A>\n {BEGIN INITIAL;printf("accepted");}
<DEAD>0 BEGIN DEAD;
<DEAD>1 BEGIN DEAD;
<DEAD>\n {BEGIN INITIAL ;printf("not accepted");}
%%
int yywrap(){
  return 1;
}
int main()
{
  printf("input the string");
  yylex();
}