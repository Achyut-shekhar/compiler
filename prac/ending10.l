%{
  #include<stdio.h>
%}
%s A B DEAD
%%
<INITIAL>0 BEGIN INITIAL;
<INITIAL>1 BEGIN A;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n {BEGIN INITIAL;printf("not accpeted");}
<A>0 BEGIN B;
<A>1 BEGIN A;
<A>[^01\n] BEGIN DEAD;
<A>\n {BEGIN INITIAL; printf("not accepted");}
<B>0 BEGIN INITIAL;
<B>1 BEGIN A;
<B>[^01\n] BEGIN DEAD;
<B>\n {BEGIN INITIAL; printf(" accepted");}
<DEAD>0 BEGIN DEAD;
<DEAD>1 BEGIN DEAD;
<DEAD>[^01\n] BEGIN DEAD;
<DEAD>\n {BEGIN INITIAL; printf("not accepted");}
%%
int yywrap(){
    return 1;
}
int main(){
    printf("input the string");
    yylex();
}