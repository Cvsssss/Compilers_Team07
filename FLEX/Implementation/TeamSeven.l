%{
#include <stdio.h>

%}

%%

%%

int yywrap(void) { return 1; }

int main() {
    printf("\nEnter text (type 'end' to finish or Ctrl + Z(windows)/Ctrl + D(Linux/MacOS)):\n");
    yylex();

    return 0;
}

