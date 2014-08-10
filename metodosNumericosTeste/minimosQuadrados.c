//+------------------------------------------------------------------+
//|                                     Método de Mínimos Quadrados  |
//|                 Copyright © 2014, Cleiton Gomes; Vanessa Barbosa |
//|                                   http://www.softwarecsg.com.br  |
//+------------------------------------------------------------------+

#include <stdio.h>
#include <stdlib.h>

double calculoCoeficienteLinear();
double calculoCoeficienteAngular();

double calculoCoeficienteLinear(int quantidadeVelas){
    FILE *arquivo;
    double x[quantidadeVelas], y[quantidadeVelas];
    double soma_x = 0, soma_y = 0;
    double numerador, denominador;
    double variacaoLinear;
    int i;
    
    arquivo = fopen("dadosMinimosQuadrados.txt","rt");
    
    for(i = 1; i < quantidadeVelas; i++){
        fscanf(arquivo, "%lf",&x[i]);
        fscanf(arquivo, "%lf",&y[i]);
        soma_x = soma_x + x[i];
        soma_y = soma_y + y[i];     
    }
    
    for(i = 1; i < quantidadeVelas; i++){
        numerador = x[i]*(y[i] - soma_x/quantidadeVelas);
        denominador = y[i]*(x[i] - soma_y/quantidadeVelas);    
    }
    
    variacaoLinear = numerador/denominador;
    
    fclose(arquivo);
    
    return variacaoLinear;
}

double calculoCoeficienteAngular(int quantidadeVelas){ 
    FILE *arquivo;
    double x[quantidadeVelas], y[quantidadeVelas];
    double soma_x = 0, soma_y = 0;
    double variacaoAngular;
    int i;
    
    arquivo = fopen("dadosMinimosQuadrados.txt","rt");
    
    for(i = 1; i < quantidadeVelas; i++){
        fscanf(arquivo, "%lf",&x[i]);
        fscanf(arquivo, "%lf",&y[i]);
        soma_x = soma_x + x[i];
        soma_y = soma_y + y[i];     
    }

    variacaoAngular = soma_y/quantidadeVelas - (calculoCoeficienteLinear(quantidadeVelas)*soma_x/quantidadeVelas);
    
    fclose(arquivo);
    
    return variacaoAngular;
}

