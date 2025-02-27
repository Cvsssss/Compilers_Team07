/* Declarations section */
%{
#include <stdio.h>  // Include the standard input/output library

// Declaring four counters
int no_of_lines = 0;      // Counter for the number of lines
int no_of_chars = 0;      // Counter for the number of characters
int no_of_a_plus = 0;     // Counter for occurrences of 'a+'
int no_of_a = 0;          // Counter for individual 'a' characters
%}

/* Rules */
%%
\n         { no_of_lines++; }  // Rule to count new lines
a+         { no_of_a_plus++; no_of_chars += strlen(yytext); }  // Rule to count 'a+' and the correct way to count all the chars
a          { no_of_a++; no_of_chars++; }  // Rule to count individual 'a' characters TO SEE THE DIFFERENCE
.          { no_of_chars++; }  // Rule to count any other character
end        { return 0; }       // Rule to stop the input processing
%%

/*  code section */
int yywrap() {
    return 1;  // Indicate that there are no more files to process
}

int main(int argc, char **argv) {
    printf("Enter text. Type 'end' to finish:\n");

    yylex();  // Call the lexical analyzer

    // Print the results
    printf("Number of lines = %d\n", no_of_lines);
    printf("Number of characters = %d\n", no_of_chars);
    printf("Number of 'a+' = %d\n", no_of_a_plus);
    printf("Number of individual 'a' = %d\n", no_of_a);

    return 0;
}