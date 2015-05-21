#include <stdio.h>
#include <string.h>

/*
argumento 1 = decisao
argumento 2 = alavanca
argumento 3 = fibonacci
argumento 4 = minimos quadrados
argumento 5 = resistencia
*/


int main(int argc, char const *argv[])
{
	
	FILE* arquivoDecisaoFInal;

	arquivoDecisaoFInal=fopen("../../MQL4/Files/decisaoFinal.txt","wt");
	fprintf(arquivoDecisaoFInal,"%s\n", argv[1]);
	fprintf(arquivoDecisaoFInal,"%s\n", argv[2]);
	fprintf(arquivoDecisaoFInal,"%s\n", argv[3]);
	fprintf(arquivoDecisaoFInal,"%s\n", argv[4]);
	fprintf(arquivoDecisaoFInal,"%s\n", argv[5]);

	fclose(arquivoDecisaoFInal);
	return 0;
}