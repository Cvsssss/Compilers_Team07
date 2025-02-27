%{
#include <stdio.h>

int no_of_lines = 0;
int no_of_chars = 0;
int no_of_numbers = 0; // Contador para números
%}

%%

[0-9]+   { ++no_of_numbers; printf("Número detectado: %s\n", yytext); }
\n       { ++no_of_lines; }
.        { ++no_of_chars; }
end      { return 0; }

%%

int yywrap() { return 1; }

int main() {
    yylex();
    printf("Líneas: %d, Caracteres: %d, Números: %d\n", no_of_lines, no_of_chars, no_of_numbers);
    return 0;
}
