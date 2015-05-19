//+------------------------------------------------------------------+
//|                           Copyright 2014, Cleiton da Silva Gomes |
//|                                    http://www.championsfx.com    |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, Cleiton da Silva Gomes"
#property link      "http://www.softwarecsg.com.br"
#property version   "1.00"
#include "pearsonBiblioteca.mq4";
#include "suporteResistenciaBiblioteca.mq4"
#include "minimosQuadradosBiblioteca.mq4"

#define CORRELACAO_ACEITAVEL 0.9


#define CANDLES_MINIMOS_QUADRADOS 34

#define RETRACAO_023 0.23
#define RETRACAO_038 0.38
#define RETRACAO_062 0.62


#define QUANTIDADE_PONTOS_DESCIDOS_ACEITAVEIS 0.0041
 
extern double ALAVANCAGEM = 0.1;
extern double STOP_LOSS;
extern double TAKE_PROFIT;
extern double pontoPreVenda_1;
extern bool venda_1;

int ticketOrdem1;

string nome = "eternoAprendiz";


int start(){

   if(OrdersTotal() == 0){
      pontoPreVenda_1 = calculoRetracaoFibonacci(RETRACAO_038);
   }
   else{
      pontoPreVenda_1 = 0;
   }
   
   if(correlacao_pearson(34) > CORRELACAO_ACEITAVEL && mercadoCaindoOuSubindo() && 
     (pontoPreVenda_1 > Bid && pontoPreVenda_1 < Ask)){  
      venda_1 = true;    
   }
  
   if(venda_1 == true && OrdersTotal() == 0){
      realizaVendaOrdem1();
   }
   else{
      venda_1 = false;
   }
   
   exibeInformacaoNaTela();
   
   return(0);

}


double calculoTakeProfitMininosQuadrados(){
   return calculoCoeficienteLinear(CANDLES_MINIMOS_QUADRADOS) * suporte() + calculoCoeficienteAngular(CANDLES_MINIMOS_QUADRADOS);

}

void realizaVendaOrdem1(){ 
   STOP_LOSS = resistencia();
   TAKE_PROFIT = calculoTakeProfitMininosQuadrados();
   
   RefreshRates();   
   while (IsTradeContextBusy()) Sleep(5);
   
   ticketOrdem1 = OrderSend(Symbol(),OP_SELL,ALAVANCAGEM,Bid,0,STOP_LOSS,
                  TAKE_PROFIT,nome,AccountNumber(),0,Red); 
}


double calculoRetracaoFibonacci(double valorRetracaoFibonacci){
   
   double retracaoFibonacci;
   
   if(resistencia() > suporte() && resistencia() - suporte() > QUANTIDADE_PONTOS_DESCIDOS_ACEITAVEIS && mercadoCaindoOuSubindo()){
      retracaoFibonacci = (resistencia() - suporte()) * valorRetracaoFibonacci + suporte();
   }
   else{
      retracaoFibonacci = 0;
   }
   
   return retracaoFibonacci;
}


void exibeInformacaoNaTela(){

   double pontoPositivo, pontoNegativo;

	for(int j=0; j < OrdersHistoryTotal();j++){
	      OrderSelect(j,SELECT_BY_POS,MODE_HISTORY);
	      
		   if(OrderSymbol()!=Symbol()) continue;
		   if(OrderMagicNumber() != AccountNumber()) continue;
		   
		   if(OrderProfit() > 0){
		       pontoPositivo++; 
		   }
		   else{ 
		      pontoNegativo++;
		   }
	}
	if(pontoNegativo + pontoPositivo != 0)
	   double porcentagemAcerto = ((pontoPositivo)/(pontoNegativo + pontoPositivo))*100;
   
   Comment(
       "             EXPERT INVEST_MVC mql"+"\n",
       
       "\___________________________________/"+"\n",
       "    Correlação = ", correlacao_pearson(34) +"\n",
       "\___________________________________/"+"\n",
       "    Retracao Fibonacci 0.38 = ", calculoRetracaoFibonacci(RETRACAO_038) +"\n",
       "\___________________________________/"+"\n",
       "    Coeficiente angular  = ", calculoCoeficienteAngular(CANDLES_MINIMOS_QUADRADOS)+"\n",
       "    Coeficiente linear  = ", calculoCoeficienteLinear(CANDLES_MINIMOS_QUADRADOS)+"\n",
       "\___________________________________/"+"\n",
       "    Porcentagem de acerto  = ", porcentagemAcerto+"\n", 
       "\___________________________________/"+"\n",
       "    Take profit  = ", TAKE_PROFIT+"\n", 
       "    Stop loss  = ", STOP_LOSS+"\n", 
       "\___________________________________/"+"\n",
      ""
   );
}

