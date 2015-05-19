//+------------------------------------------------------------------+
//|                                   minimosQuadradosBiblioteca.mq4 |
//|                                  Copyright 2015, championsfx.com |
//|                                      https://www.championsfx.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2015, championsfx.com"
#property link      "https://www.championsfx.com"


double calculoCoeficienteLinear(int quantidadeVelas){
    double soma_x = 0, soma_y = 0;
    double numerador = 0, denominador = 0;
    double variacaoLinear;
    int i;
   
    for(i = 0; i < quantidadeVelas; i++){
        soma_x = soma_x + Open[i];
        soma_y = soma_y + Close[i+5];     
    }
    
    for(i = 0; i < quantidadeVelas; i++){
        numerador += (Open[i] - soma_x/quantidadeVelas)*(Close[i] - soma_y/quantidadeVelas);
        denominador += (Open[i] - soma_x/quantidadeVelas)*(Open[i] - soma_x/quantidadeVelas); 
    }
    
    variacaoLinear = numerador/denominador;
    
    return variacaoLinear;
}

double calculoCoeficienteAngular(int quantidadeVelas){ 
    double soma_x = 0, soma_y = 0;
    double variacaoAngular;
    int i;
    
    for(i = 0; i < quantidadeVelas; i++){
        soma_x = soma_x + Open[i];
        soma_y = soma_y + Close[i];     
    }

    variacaoAngular = soma_y/quantidadeVelas - (calculoCoeficienteLinear(quantidadeVelas)*soma_x/quantidadeVelas);
    
    return variacaoAngular;
}
