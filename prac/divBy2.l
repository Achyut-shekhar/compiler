%{
   #include<stdio.h>  
%}
%s  A B DEAD
%%
<INITIAL>0 {BEGIN INITIAL;}
<INITIAL>1 {BEGIN A;}
<INITIAL>[^01\n] {BEGIN DEAD;}
<INITIAL>\n {printf("valid");}

<A>0 {BEGIN B;}
<A>1 {BEGIN A;}
<A>[^01\n] {BEGIN DEAD;}
<A>\n {printf("invalid");}

<B>0 {BEGIN INITIAL;}
<B>1 {BEGIN B;}
<B>[^01\n] {BEGIN DEAD;}
<B>\n {printf("invalid");}

<DEAD>0 {BEGIN DEAD;}
<DEAD>1 {BEGIN DEAD;}
<DEAD>[^01\n] {BEGIN DEAD;}
<DEAD>\n {printf("invalid");}
%%
int yywrap(){
  return 1;
}
int main(){
  printf("input the binary div by 2");
  yylex();
}