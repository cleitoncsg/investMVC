#include <stdio.h>
#include <string.h>

/*
argumento 1 = decisao
argumento 2 = fibonacci
argumento 3 = minimos quadrados
argumento 4 = resistencia
*/


int main(int argc, char const *argv[])
{
	
	FILE* arquivoDecisaoFInal;

	arquivoDecisaoFInal=fopen("../../MQL4/Files/decisaoFinal.txt","wt");
	fprintf(arquivoDecisaoFInal,"%s\n", argv[1]);
	fprintf(arquivoDecisaoFInal,"%s\n", argv[2]);
	fprintf(arquivoDecisaoFInal,"%s\n", argv[3]);
	fprintf(arquivoDecisaoFInal,"%s", argv[4]);

	fclose(arquivoDecisaoFInal);
	return 0;
}