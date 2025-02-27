/* Declaring two counters one for number
of lines other for number of characters */
%{
int num_of_2or4_a = 0;
int op_onedigit_plus_onedigit = 0;
%}

/***rule 1 counts the number of lines,
rule 2 counts the number of characters
and rule 3 specifies when to stop
taking input***/
%%
a{2,4}   ++num_of_2or4_a;
[0-9][+\-\*\/][0-9]  printf("->Operation found: %s\n", yytext), ++op_onedigit_plus_onedigit;
end  return 0;
.           { /* Ignorar otros caracteres */ }
%%

/*** User code section***/
int yywrap(){}
int main(int argc, char **argv)
{

yylex();
printf("number of aa or aaaa = %d, number of operations of one digit = %d\n",
    num_of_2or4_a, op_onedigit_plus_onedigit);

return 0;
}