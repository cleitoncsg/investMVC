//+------------------------------------------------------------------+
//|                                            bibliotecaPearson.mq4 |
//|                           Copyright 2014, Cleiton da Silva Gomes |
//|                                    http://www.softwarecsg.com.br |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, Cleiton da Silva Gomes"
#property link      "http://www.softwarecsg.com.br"

#property version   "1.00"
double estado_mercado;

double estadoMercado(){
   return estado_mercado;
}

double correlacao_pearson(int tempoCorrelacao){
	     int c =0;
	     double soma_ordenadas = 0;
	     double soma_abcissas = 0;
	     double soma_ordenadas_quadrado = 0;
	     double soma_abcissas_quadrado = 0;
	     double numero_abcissa;
	     double numero_ordenada;
	     double soma_X_vezes_Y = 0;
	     double numerador, denominador_1,denominador,correlacao;
	 
        for(c=0; c<tempoCorrelacao; c++){
           numero_abcissa = NormalizeDouble(Open[c],5);
           numero_ordenada =NormalizeDouble(Close[c],5);    
		     soma_abcissas = soma_abcissas + numero_abcissa;
		     soma_abcissas_quadrado = (soma_abcissas_quadrado) + (numero_abcissa)*(numero_abcissa);
		     soma_ordenadas = soma_ordenadas + numero_ordenada;
		     soma_ordenadas_quadrado = (soma_ordenadas_quadrado) + (numero_ordenada)*(numero_ordenada);
		     soma_X_vezes_Y = soma_X_vezes_Y + (numero_ordenada*numero_abcissa);
	     } 
	
	     numerador =((tempoCorrelacao*soma_X_vezes_Y)-((soma_abcissas)*(soma_ordenadas)));
	     denominador_1 =((tempoCorrelacao*soma_abcissas_quadrado)-(soma_abcissas*soma_abcissas))*
	     ((tempoCorrelacao*soma_ordenadas_quadrado)-(soma_ordenadas*soma_ordenadas));	
	     
	     denominador = MathPow(denominador_1,1.0/2.0); 
	
        if(denominador != 0)
            correlacao = numerador/denominador;
        else
            correlacao = 0;  
        
        estado_mercado = soma_abcissas - soma_ordenadas;
   
        return (correlacao);
}


double correlacao_pearson_volume(int tempoCorrelacao){
	     int c =0;
	     double soma_ordenadas = 0;
	     double soma_abcissas = 0;
	     double soma_ordenadas_quadrado = 0;
	     double soma_abcissas_quadrado = 0;
	     double numero_abcissa;
	     double numero_ordenada;
	     double soma_X_vezes_Y = 0;
	     double numerador, denominador_1,denominador,correlacao;
	 
        for(c=0; c<tempoCorrelacao; c++){
           numero_abcissa = NormalizeDouble(Volume[c],5);
           numero_ordenada =NormalizeDouble(Volume[c+1],5);    
		     soma_abcissas = soma_abcissas + numero_abcissa;
		     soma_abcissas_quadrado = (soma_abcissas_quadrado) + (numero_abcissa)*(numero_abcissa);
		     soma_ordenadas = soma_ordenadas + numero_ordenada;
		     soma_ordenadas_quadrado = (soma_ordenadas_quadrado) + (numero_ordenada)*(numero_ordenada);
		     soma_X_vezes_Y = soma_X_vezes_Y + (numero_ordenada*numero_abcissa);
	     } 
	
	     numerador =((tempoCorrelacao*soma_X_vezes_Y)-((soma_abcissas)*(soma_ordenadas)));
	     denominador_1 =((tempoCorrelacao*soma_abcissas_quadrado)-(soma_abcissas*soma_abcissas))*
	     ((tempoCorrelacao*soma_ordenadas_quadrado)-(soma_ordenadas*soma_ordenadas));	
	     
	     denominador = MathPow(denominador_1,1.0/2.0); 
	
        if(denominador != 0)
            correlacao = numerador/denominador;
        else
            correlacao = 0;  
        
        estado_mercado = soma_abcissas - soma_ordenadas;
   
        return (correlacao);
}

