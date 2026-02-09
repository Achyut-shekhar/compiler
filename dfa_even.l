%{
  #include<stdio.h>
  #include<string.h>
%}
%s A B

%%
<INITIAL>1 BEGIN INITIAL;
<INITIAL>0  BEGIN A;
<INITIAL>[^01\n] BEGIN B;
<INITIAL>\n   {BEGIN INITIAL; printf("Accepted\n");}
<A>1   BEGIN A;
<A>0   BEGIN INITIAL;
<A>[^01\n]  BEGIN B;
<A>\n   {BEGIN INITIAL; printf("NOT Accepted\n");}
<B>0  BEGIN B;
<B>1  BEGIN B;
<B>[^01\n] BEGIN B;
<B>\n   {BEGIN INITIAL; printf("NOT Accepted\n");}
%%

int yywrap(){
  return 1;
}

int main(){
  printf("DFA - Accepts strings with even number of 0s\n");
  printf("Enter binary strings (press Ctrl+D or Ctrl+Z to exit):\n\n");
  
  yylex();
  
  return 0;
}