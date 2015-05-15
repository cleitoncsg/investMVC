//+------------------------------------------------------------------+
//|                                     Método de Correlacão Linear  |
//|                 Copyright © 2014, Cleiton Gomes; Vanessa Barbosa |
//|                                   http://www.softwarecsg.com.br  |
//+------------------------------------------------------------------+

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define QUANTIDADE_CANDLES 100
#define TAMANHO_STRING 50

char nomeRobo[TAMANHO_STRING], nomeTipoGrafico[2];
double quantidadeCandes;
double tendencia;

double calculaCorrelacao(int tempoCorrelacao);
void detectaRoboETipoDeGrafico();

int main(){
	FILE *arquivo;
	FILE *arquivoTendencia;
	
	detectaRoboETipoDeGrafico();
	printf("METODO CORRELACAO EM C LIGADO\n");
	//printf("Correlacao Linear em C: %f\n",calculaCorrelacao(quantidadeCandes));
	
	arquivo = fopen("../correlacaoResposta.txt", "wt");
	fprintf(arquivo, "%f", calculaCorrelacao(quantidadeCandes));
	
	fclose(arquivo);
	arquivoTendencia = fopen("../tendencia.txt", "wt");
	//printf("tendencia : %f\n", tendencia);
	fprintf(arquivoTendencia, "%f", tendencia);
    
	fclose(arquivoTendencia);
	
	return 0;	
}

void detectaRoboETipoDeGrafico(){
    FILE *arquivo;
    char temporariaQuantidadeCandle[10];

    arquivo = fopen("../criterioEntrada.txt","rt");
    
    if(arquivo == NULL){
    	printf("Arquivo nulo\n");
    }
    
    fscanf(arquivo,"%s",nomeRobo);
    //printf("nome robo: %s\n", nomeRobo);
    fscanf(arquivo,"%s",nomeTipoGrafico);
    //printf("Nome tipo grafico: %s\n", nomeTipoGrafico);
    fscanf(arquivo, "%s",temporariaQuantidadeCandle);
    //printf("Quantidade candles %s\n", temporariaQuantidadeCandle);
    quantidadeCandes = atoi(temporariaQuantidadeCandle);
    
    fclose(arquivo);
}

double calculaCorrelacao(int tempoCorrelacao){

    FILE *arquivo;
    int c;
    double somaOrdenadas = 0, somaAbcissas = 0,
           somaOrdenadasQuadrado = 0, somaAbcissasQuadrado = 0,
           somaXvezesY = 0, correlacao,
           numeroAbcissa, numeroOrdenada,
           numerador, denominador_1,denominador; 
    
    double leituraCotacoes[tempoCorrelacao];

    if( (strcmp(nomeTipoGrafico,"M1")) == 0)
            arquivo = fopen("../../MQL4/Files/M1.csv","rt"); 
    else if( (strcmp(nomeTipoGrafico,"M5")) == 0)
            arquivo = fopen("../../MQL4/Files/M5.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"M15")) == 0)
            arquivo = fopen("../../MQL4/Files/M15.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"M30")) == 0)
            arquivo = fopen("../../MQL4/Files/M30.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"H1")) == 0)
            arquivo = fopen("../../MQL4/Files/H1.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"H4")) == 0)
            arquivo = fopen("../../MQL4/Files/H4.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"D1")) == 0)
            arquivo = fopen("../../MQL4/Files/D1.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"MN1")) == 0)
            arquivo = fopen("../../MQL4/Files/MN1.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"W1")) == 0)
            arquivo = fopen("../../MQL4/Files/W1.csv","rt");
    else
            printf("Erro, tabela nao encontrada\n");

    for(c=0; c<= tempoCorrelacao; c++){
        fscanf(arquivo, "%lf",&leituraCotacoes[c]);
    }

    for(c=0; c< tempoCorrelacao; c++){
        numeroAbcissa = leituraCotacoes[c];
        numeroOrdenada = leituraCotacoes[c+1];

        somaAbcissas =   somaAbcissas + numeroAbcissa;
        somaAbcissasQuadrado += (numeroAbcissa*numeroAbcissa);
        somaOrdenadas = somaOrdenadas + numeroOrdenada;
        somaOrdenadasQuadrado += (numeroOrdenada*numeroOrdenada);
        somaXvezesY = somaXvezesY + (numeroOrdenada*numeroAbcissa);
     }
     
    numerador =((tempoCorrelacao*somaXvezesY)-((somaAbcissas)*(somaOrdenadas)));
    printf("Numerador %lf\n", numerador);
    denominador_1 =((tempoCorrelacao*somaAbcissasQuadrado)-(somaAbcissas*somaAbcissas))*
    ((tempoCorrelacao*somaOrdenadasQuadrado)-(somaOrdenadas*somaOrdenadas));

    denominador = sqrt(denominador_1); 
    printf("Denominador %lf\n", denominador);
	tendencia = somaAbcissas - somaOrdenadas;
    correlacao = numerador/denominador;

    fclose(arquivo);
    printf("Correlacao: %lf\n", correlacao);
    return correlacao;    
}


