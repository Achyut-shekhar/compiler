%{
  #include<stdio.h>
  #include<string.h>
%}
%s A B C D DEAD

%%
<INITIAL>0  BEGIN A;
<INITIAL>1  BEGIN INITIAL;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<A>0   BEGIN B;
<A>1   BEGIN INITIAL;
<A>[^01\n]  BEGIN DEAD;
<A>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<B>0  BEGIN B;
<B>1  BEGIN C;
<B>[^01\n] BEGIN DEAD;
<B>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<C>0  BEGIN A;
<C>1  BEGIN D;
<C>[^01\n] BEGIN DEAD;
<C>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<D>0  BEGIN A;
<D>1  BEGIN INITIAL;
<D>[^01\n] BEGIN DEAD;
<D>\n   {BEGIN INITIAL; printf("Accepted\n");}

<DEAD>0  BEGIN DEAD;
<DEAD>1  BEGIN DEAD;
<DEAD>[^01\n] BEGIN DEAD;
<DEAD>\n   {BEGIN INITIAL; printf("Not accepted (invalid input)\n");}
%%

int yywrap(){
  return 1;
}

int main(){
  printf("DFA - Accepts strings ending with '0011'\n");
  printf("Enter binary strings (press Ctrl+D or Ctrl+Z to exit):\n\n");
  
  yylex();
  
  return 0;
}
