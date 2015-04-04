
//+------------------------------------------------------------------+
//|                                Método de Regressão de Fibonacci  |
//|                 Copyright © 2014, Cleiton Gomes; Vanessa Barbosa |
//|                                   http://www.softwarecsg.com.br  |
//+------------------------------------------------------------------+

#include <stdio.h>
#include <stdlib.h>
#define TAMANHO_STRING 50

char nomeRobo[TAMANHO_STRING], nomeTipoGrafico[2];

void detectaRoboETipoDeGrafico();
double calculoSuporte(int quantidadeVelas);
double calculoResistencia(int quantidadeVelas);
double calculoRegressaoFibonacci(double fatorDeRegressao, int quantidadeVelas);
double quantidadeCandes;

int main(){
    FILE *arquivo;

    detectaRoboETipoDeGrafico();
    //printf("Suporte = %lf, resistencia = %lf\n",calculoSuporte(13),calculoResistencia(13));
    //printf("Regressao De Fibonacci = %lf\n",calculoRegressaoFibonacci(0.23, 13));
    printf("METODO FIBONACCI EM C LIGADO\n");

    arquivo = fopen("respostaFibonacci.txt","wt");
    
    fprintf(arquivo, "%f\n", calculoRegressaoFibonacci(0.23, quantidadeCandes));
    fprintf(arquivo, "%f\n", calculoRegressaoFibonacci(0.38, quantidadeCandes));
    fprintf(arquivo, "%f\n", calculoRegressaoFibonacci(0.61, quantidadeCandes));
	
    fclose(arquivo);

    return 0;
}

void detectaRoboETipoDeGrafico(){
    FILE *arquivo;
    char temporariaQuantidadeCandle[10];

    arquivo = fopen("criterioEntrada.txt","rt");
    
    if(arquivo == NULL){
    	printf("Arquivo nulo\n");
    }
    
    fscanf(arquivo,"%s",nomeRobo);
    //printf("nome robo: %s\n", nomeRobo);
    fscanf(arquivo,"%s",nomeTipoGrafico);
    //printf("Nome tipo grafico: %s\n", nomeTipoGrafico);
    fscanf(arquivo, "%s",&temporariaQuantidadeCandle);
    //printf("Quantidade candles %s\n", temporariaQuantidadeCandle);
    quantidadeCandes = atoi(temporariaQuantidadeCandle);
    
    fclose(arquivo);
}

double calculoSuporte(int quantidadeVelas){
    FILE *arquivo;
    double cotacao[quantidadeVelas];
    double suporte = 0;
    int i;
    
     if( (strcmp(nomeTipoGrafico,"M1")) == 0)
            arquivo = fopen("tabela1Minuto.csv","rt"); 
    else if( (strcmp(nomeTipoGrafico,"M5")) == 0)
            arquivo = fopen("tabela5Minutos.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"H1")) == 0)
            arquivo = fopen("tabela1Hora.csv","rt");
    else
            printf("Erro, tabela nao encontrada\n");

    for(i=0; i <= quantidadeVelas; i++){
        fscanf(arquivo, "%lf",&cotacao[i]);
    }

    for(i = 0; i < quantidadeVelas; i++){
        fscanf(arquivo, "%lf",&cotacao[i]);
        
        if(suporte < cotacao[i])
            suporte = cotacao[i];
    }
    
    fclose(arquivo);
    
    return suporte;
}

double calculoResistencia(int quantidadeVelas){
    FILE *arquivo;
    double cotacao[quantidadeVelas];
    double resistencia = 777;
    int i;
    
    if( (strcmp(nomeTipoGrafico,"M1")) == 0)
            arquivo = fopen("tabela1Minuto.csv","rt"); 
    else if( (strcmp(nomeTipoGrafico,"M5")) == 0)
            arquivo = fopen("tabela5Minutos.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"H1")) == 0)
            arquivo = fopen("tabela1Hora.csv","rt");
    else
            printf("Erro, tabela nao encontrada\n");

    for(i=0; i <= quantidadeVelas; i++){
        fscanf(arquivo, "%lf",&cotacao[i]);
    }
    
    for(i = 0; i < quantidadeVelas; i++){
        fscanf(arquivo, "%lf",&cotacao[i]);
        
        if(resistencia > cotacao[i])
            resistencia = cotacao[i];
    }
    
    fclose(arquivo);
    
    return resistencia;
}

double calculoRegressaoFibonacci(double fatorDeRegressao, int quantidadeVelas){
    double variacaoDePontos = calculoSuporte(quantidadeVelas) - calculoResistencia(quantidadeVelas);
    return (variacaoDePontos*fatorDeRegressao) + calculoSuporte(quantidadeVelas);
}

