%{
#include <stdio.h>

int count_pattern = 0; // ocurrencias del patron
%}

%%

[-09]     { count_pattern++; }    
end       { return 0; }  

%%

int main() {
	printf("\nReconoceremos las ocurrencias del patron [-09]\n");
    printf("Ingresa un texto ('end' para finalizar o Ctrl + Z(windows)/Ctrl + D(Linux/MacOS)):\n");
    yylex();
    printf("\nResultados:\n");
    printf("Ocurrencias de '-', '0' o '9' = %d\n", count_pattern);
    return 0;
}

int yywrap() {
    return 1;
}
