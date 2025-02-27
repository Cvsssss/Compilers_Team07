/* Declaring three counters:
   - one for number of lines
   - one for number of characters
   - one for number of occurrences of 'a+'
*/
%{
int no_of_lines = 0;
int no_of_chars = 0;
int no_of_a_plus = 0;  // NEW COUNTER FOR 'a+'
%}

/***rule 1 counts the number of lines,
rule 2 counts the number of characters,
rule 3 counts the number of 'a+',
and rule 4 specifies when to stop
taking input***/
%%
\n         ++no_of_lines;
.          ++no_of_chars;
a+         ++no_of_a_plus;  // NEW RULE FOR 'a+'
end        return 0;
%%

/*** User code section***/
int yywrap(){}
int main(int argc, char **argv)
{
    yylex();
    printf("number of lines = %d, number of chars = %d, number of 'a+' = %d\n",
           no_of_lines, no_of_chars, no_of_a_plus);

    return 0;
}