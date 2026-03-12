%{
  #include<stdio.h>
  #include<string.h>
%}
%s A B C D DEAD

%%
<INITIAL>0  BEGIN A;
<INITIAL>1  BEGIN C;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<A>0   BEGIN A;
<A>1   BEGIN B;
<A>[^01\n]  BEGIN DEAD;
<A>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<B>0  BEGIN A;
<B>1  BEGIN B;
<B>[^01\n] BEGIN DEAD;
<B>\n   {BEGIN INITIAL; printf("Accepted\n");}

<C>0  BEGIN D;
<C>1  BEGIN C;
<C>[^01\n] BEGIN DEAD;
<C>\n   {BEGIN INITIAL; printf("Not accepted\n");}

<D>0  BEGIN D;
<D>1  BEGIN C;
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
  printf("DFA - Accepts strings that start and end with DIFFERENT characters\n");
  printf("Enter binary strings (press Ctrl+D or Ctrl+Z to exit):\n\n");
  
  yylex();
  
  return 0;
}
