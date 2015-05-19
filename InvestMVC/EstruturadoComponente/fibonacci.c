
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
void lerTendencia();

double quantidadeCandes;
double tendencia;

int main(){
    FILE *arquivo;
    FILE *arquivoSuporteResistencia;

    detectaRoboETipoDeGrafico();
    lerTendencia();
    //printf("Suporte = %lf, resistencia = %lf\n",calculoSuporte(13),calculoResistencia(13));
    //printf("Regressao De Fibonacci = %lf\n",calculoRegressaoFibonacci(0.23, 13));
    printf("METODO FIBONACCI EM C LIGADO\n");

    arquivo = fopen("../fibonacciResposta.txt","wt");
    
    //fprintf(arquivo, "%f\n", calculoRegressaoFibonacci(0.23, quantidadeCandes));
    fprintf(arquivo, "%f\n", calculoRegressaoFibonacci(0.38, quantidadeCandes));
    //fprintf(arquivo, "%f\n", calculoRegressaoFibonacci(0.62, quantidadeCandes));
    fclose(arquivo);    

    arquivoSuporteResistencia = fopen("../suporteResistencia.txt","wt");
    fprintf(arquivoSuporteResistencia, "%f\n", calculoSuporte(quantidadeCandes));
    fprintf(arquivoSuporteResistencia, "%f\n", calculoResistencia(quantidadeCandes));

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
    fscanf(arquivo, "%s",&temporariaQuantidadeCandle);
    //printf("Quantidade candles %s\n", temporariaQuantidadeCandle);
    quantidadeCandes = atoi(temporariaQuantidadeCandle);
    
    fclose(arquivo);
}

double calculoSuporte(int quantidadeVelas){
    FILE *arquivo;
    double cotacao[quantidadeVelas];
    double suporte = 777;
    int i;
    
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

    for(i = 0; i <= quantidadeVelas; i++){
        fscanf(arquivo, "%lf",&cotacao[i]);
        if(suporte > cotacao[i])
            suporte = cotacao[i];
    }
    
    fclose(arquivo);
    return suporte;
}

double calculoResistencia(int quantidadeVelas){
    FILE *arquivo;
    double cotacao[quantidadeVelas];
    double resistencia = 0;
    int i;
    
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
    
    for(i = 0; i <= quantidadeVelas; i++){
        fscanf(arquivo, "%lf",&cotacao[i]);
        
        if(resistencia < cotacao[i])
            resistencia = cotacao[i];
    }
    
    fclose(arquivo);
    return resistencia;
}

double calculoRegressaoFibonacci(double fatorDeRegressao, int quantidadeVelas){
    double variacaoDePontos;
    double fibonacci;

    if(tendencia>0){
        variacaoDePontos = calculoSuporte(quantidadeVelas)-calculoResistencia(quantidadeVelas);
        fibonacci = (variacaoDePontos*fatorDeRegressao) + calculoResistencia(quantidadeVelas);
        return fibonacci;
    }

    else{
        variacaoDePontos = calculoResistencia(quantidadeVelas)-calculoSuporte(quantidadeVelas);
        fibonacci = (variacaoDePontos*fatorDeRegressao) + calculoSuporte(quantidadeVelas);
        return fibonacci;
    }
}

void lerTendencia(){
    FILE *arquivoTendencia;
    double temporariaTendencia;

    arquivoTendencia = fopen("../tendencia.txt","rt");
    
    if(arquivoTendencia == NULL){
        printf("Arquivo nulo\n");
    }
    
    fscanf(arquivoTendencia, "%lf",&temporariaTendencia);
    tendencia = temporariaTendencia;
    //printf("Tendencia: %lf\n", tendencia);
    
    fclose(arquivoTendencia);
}

