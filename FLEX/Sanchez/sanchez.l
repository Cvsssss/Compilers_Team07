/*
Declaring a counter for the group
of four 'a' together ('aaaa')
*/

%{
#include <stdio.h>
int no_of_a = 0;
%}

%%
a{4}         ++no_of_a;    // This is to count 'aaaa'
end          return 0;     // This is to finish
\n	 					 ; // Ignore lines jumps
.             ;            // Ignore any other characters
%%

int yywrap(void) { return 1; }

int main(int argc, char **argv)
{
    printf("Write a text:\n");
    yylex();
    printf("number of 'aaaa' = %d\n", no_of_a);
    return 0;
}
