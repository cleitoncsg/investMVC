
//+------------------------------------------------------------------+
//|                                Método de Regressão de Fibonacci  |
//|                 Copyright © 2014, Cleiton Gomes; Vanessa Barbosa |
//|                                   http://www.softwarecsg.com.br  |
//+------------------------------------------------------------------+

#include <stdio.h>
#include <stdlib.h>


double calculoSuporte(int quantidadeVelas);
double calculoResistencia(int quantidadeVelas);
double calculoRegressaoFibonacci(double fatorDeRegressao, int quantidadeVelas);

/*
int main(){
    
    printf("Suporte = %lf, resistencia = %lf\n",calculoSuporte(13),calculoResistencia(13));
    printf("Regressao De Fibonacci = %lf\n",calculoRegressaoFibonacci(0.23, 13));
    return 0;
}
*/ 

double calculoSuporte(int quantidadeVelas){
    FILE *arquivo;
    double cotacao[quantidadeVelas];
    double suporte = 0;
    int i;
    
    arquivo = fopen("dadosFibonacci.txt","rt");
    
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
    
    arquivo = fopen("dadosFibonacci.txt","rt");
    
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
    return variacaoDePontos*fatorDeRegressao;
}

