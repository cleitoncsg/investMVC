#include <stdio.h>

int main(){
FILE* arquivo;
arquivo = fopen("../criterioEntrada.txt","wt");
fclose(arquivo);

return 0;
}
