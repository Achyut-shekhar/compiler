%{
  #include<stdio.h>
  #include<string.h>
%}
%s A B C DEAD

%%
<INITIAL>1  BEGIN A;
<INITIAL>0  BEGIN C;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<A>1   BEGIN INITIAL;
<A>0   BEGIN B;
<A>[^01\n]  BEGIN DEAD;
<A>\n   {BEGIN INITIAL; printf("Accepted\n");}

<B>1  BEGIN C;
<B>0  BEGIN A;
<B>[^01\n] BEGIN DEAD;
<B>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<C>1  BEGIN B;
<C>0  BEGIN INITIAL;
<C>[^01\n] BEGIN DEAD;
<C>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<DEAD>0  BEGIN DEAD;
<DEAD>1  BEGIN DEAD;
<DEAD>[^01\n] BEGIN DEAD;
<DEAD>\n   {BEGIN INITIAL; printf("Not accepted (invalid input)\n");}
%%

int yywrap(){
  return 1;
}

int main(){
  printf("DFA - Accepts strings with even 0s AND odd 1s (with DEAD state)\n");
  printf("Enter binary strings (press Ctrl+D or Ctrl+Z to exit):\n\n");
  
  yylex();
  
  return 0;
}
