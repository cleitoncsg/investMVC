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

    arquivo = fopen("../minimosQuadradosResposta.txt","wt");
    
    fprintf(arquivo, "%f\n", calculoCoeficienteLinear(quantidadeVelas));
    fprintf(arquivo, "%f\n", calculoCoeficienteAngular(quantidadeVelas));

    //printf("Angular: %lf\n", calculoCoeficienteAngular(quantidadeVelas));
    //printf("Linear: %lf\n", calculoCoeficienteLinear(quantidadeVelas));
    fclose(arquivo);

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
    quantidadeVelas = atoi(temporariaQuantidadeCandle);
    
    fclose(arquivo);
}

double calculoCoeficienteLinear(int quantidadeVelas){
    double variacaoLinear;
    double media_y,media_x;
    FILE *arquivo;
    double x[quantidadeVelas], y[quantidadeVelas];
    double soma_x = 0, soma_y = 0;
    double variacaoAngular;
    int i,c;
    double leituraCotacoes[quantidadeVelas+1];
    
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
    
    for(c=0; c<= quantidadeVelas; c++){
        fscanf(arquivo, "%lf",&leituraCotacoes[c]);
    }

    for(c=0; c<= quantidadeVelas; c++){
        x[c] = leituraCotacoes[c];
        y[c] = leituraCotacoes[c+1];
    }

    for(i = 0; i < quantidadeVelas; i++){
        soma_x = soma_x + x[i];
        soma_y = soma_y + y[i+1];     
    }

    media_x=soma_x/quantidadeVelas;
    media_y=soma_y/quantidadeVelas;

    variacaoLinear= media_y - (calculoCoeficienteAngular(quantidadeVelas) * media_x);
    fclose(arquivo);
    
    return variacaoLinear;
}

double calculoCoeficienteAngular(int quantidadeVelas){ 
    FILE *arquivo;
    double x[quantidadeVelas], y[quantidadeVelas];
    double soma_x = 0, soma_y = 0;
    double variacaoAngular;
    int i,c;
    double numerador=0, denominador=0;
    double leituraCotacoes[quantidadeVelas+1];
    double media_x, media_y;
    
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
    
    for(c=0; c<= quantidadeVelas; c++){
        fscanf(arquivo, "%lf",&leituraCotacoes[c]);
    }

    for(c=0; c<= quantidadeVelas; c++){
        x[c] = leituraCotacoes[c];
        y[c] = leituraCotacoes[c+1];
    }

    for(i = 0; i < quantidadeVelas; i++){
        soma_x = soma_x + x[i];
        soma_y = soma_y + y[i+1];     
    }

    media_x=soma_x/quantidadeVelas;
    media_y=soma_y/quantidadeVelas;

    for (i = 0; i < quantidadeVelas; ++i)
    {
        numerador+=(x[i]-media_x)*(y[i]-media_y);
        denominador+= (x[i]-media_x)*(x[i]-media_x);
    }
    variacaoAngular=numerador/denominador;
    fclose(arquivo);
    
    return variacaoAngular;
}

