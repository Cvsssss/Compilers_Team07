%{
#include <stdio.h>

int no_of_a_plus = 0;
int count_pattern = 0;
int no_of_wxz = 0;
%}

%%
a+          { ++no_of_a_plus; }        
[-09]      { ++count_pattern; }  
w(x|y)z     {++no_of_wxz;} 

end         { return 0; }                

%%

int yywrap(void) { 
    return 1;  // Returns 1 to indicate no more input files to process
}

int main() {
    printf("\nEnter text (type 'end' to finish or Ctrl + Z(windows)/Ctrl + D(Linux/MacOS)):\n");
    yylex();  // Start lexing input
    
    // Print results after lexing
    printf("\nResults:\n");
    printf("Occurrences of 'a+' = %d\n", no_of_a_plus);     
    printf("Occurrences of '-', '0' or '9' = %d\n", count_pattern); 
    printf("Occurrences of w(x|z)z= %d\n",no_of_wxz);
    return 0;
}
