//+------------------------------------------------------------------+
//|                                     Método de Mínimos Quadrados  |
//|                 Copyright © 2014, Cleiton Gomes; Vanessa Barbosa |
//|                                   http://www.softwarecsg.com.br  |
//+------------------------------------------------------------------+

#include <stdio.h>
#include <stdlib.h>
#define LACOS 700

double variacaoLinear;
double calculoCoeficienteLinear();
double calculoCoeficienteAngular();

int main(){
    printf("\t\t_-___-__-__-__-__-__-__-__-__-_-__-_-__-_-__-_\n");
    printf("\t\t\tEquacao geral pelo metodo de minimos quadrados\n");
    printf(" \t\t\tY = %lf X + (%lf)\n", calculoCoeficienteAngular(), variacaoLinear);
    printf("\t\t_-___-__-__-__-__-__-__-__-__-_-__-_-__-_-__-_\n");
    
    return 0;
}

double calculoCoeficienteAngular(){
    FILE *arquivo;
    double x[LACOS], y[LACOS];
    double soma_x = 0, soma_y = 0;
    double numerador, denominador;
    double variacaoAngular;
    int i;
    
    arquivo = fopen("dadosMinimosQuadrados.txt","rt");
    
    for(i = 1; i < LACOS; i++){
        fscanf(arquivo, "%lf",&x[i]);
        fscanf(arquivo, "%lf",&y[i]);
        soma_x = soma_x + x[i];
        soma_y = soma_y + y[i];     
    }
    
    for(i = 1; i < LACOS; i++){
        numerador = x[i]*(y[i] - soma_x/LACOS);
        denominador = y[i]*(x[i] - soma_y/LACOS);    
    }
    
    variacaoLinear = numerador/denominador;
    variacaoAngular = soma_y/LACOS - (variacaoLinear*soma_x/LACOS);
    
    return variacaoAngular;
    
}

double calculoCoeficienteLinear(){ 
    return variacaoLinear;
}

