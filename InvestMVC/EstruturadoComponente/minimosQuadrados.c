//+------------------------------------------------------------------+
//|                                     Método de Mínimos Quadrados  |
//|                 Copyright © 2014, Cleiton Gomes; Vanessa Barbosa |
//|                                   http://www.softwarecsg.com.br  |
//+------------------------------------------------------------------+

#include <stdio.h>
#include <stdlib.h>
#define TAMANHO_STRING 50

double calculoCoeficienteLinear();
double calculoCoeficienteAngular();

char nomeRobo[TAMANHO_STRING], nomeTipoGrafico[2];

void detectaRoboETipoDeGrafico();
int quantidadeVelas;

int main(){
    FILE *arquivo;

    detectaRoboETipoDeGrafico();
    printf("METODO MINIMOS QUADRADOS LIGADO\n");
    //printf("Coeficiente Linear: %f\n",calculoCoeficienteLinear(quantidadeVelas));
    //printf("Coeficiente Angular: %f\n",calculoCoeficienteAngular(quantidadeVelas));

    arquivo = fopen("minimosQuadradosResposta.txt","wt");
    
    fprintf(arquivo, "%f\n", calculoCoeficienteLinear(quantidadeVelas));
    fprintf(arquivo, "%f\n", calculoCoeficienteAngular(quantidadeVelas));
	
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
    quantidadeVelas = atoi(temporariaQuantidadeCandle);
    
    fclose(arquivo);
}

double calculoCoeficienteLinear(int quantidadeVelas){
    FILE *arquivo;
    double x[quantidadeVelas], y[quantidadeVelas];
    double soma_x = 0, soma_y = 0;
    double numerador, denominador;
    double variacaoLinear;
    int i;
    
    if( (strcmp(nomeTipoGrafico,"M1")) == 0)
            arquivo = fopen("tabela1Minuto.csv","rt"); 
    else if( (strcmp(nomeTipoGrafico,"M5")) == 0)
            arquivo = fopen("tabela5Minutos.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"H1")) == 0)
            arquivo = fopen("tabela1Hora.csv","rt");
    else
            printf("Erro, tabela nao encontrada\n");
    
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
    
     if( (strcmp(nomeTipoGrafico,"M1")) == 0)
            arquivo = fopen("tabela1Minuto.csv","rt"); 
    else if( (strcmp(nomeTipoGrafico,"M5")) == 0)
            arquivo = fopen("tabela5Minutos.csv","rt");
    else if( (strcmp(nomeTipoGrafico,"H1")) == 0)
            arquivo = fopen("tabela1Hora.csv","rt");
    else
            printf("Erro, tabela nao encontrada\n");
    
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

