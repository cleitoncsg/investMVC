
#property copyright "Copyright 2015, Cleiton Gomes."
#property link      "https://investmvc.com"

string nome = "investMVC";
string tipoOperacao;
int ticketOrdem1;

 extern string tipoOperacaoMultiagente;
 extern string alavancaMultiagente;
 extern string pontoEntradaMultiagente;
 extern string takeProfitMultiagente;
 extern string stopLossMultiagente;
 extern bool venda_1;
   

int start(){

     int arquivo = FileOpen("decisaoFinal.txt", FILE_TXT|FILE_READ);
     if(arquivo == NULL){
         printf("Arquivo nulo!!!\n");
     }
     else{
         printf("arquivo OK");
         int str_size=FileReadInteger(arquivo,INT_VALUE);
         
         tipoOperacaoMultiagente = FileReadString(arquivo, str_size);
         alavancaMultiagente = FileReadString(arquivo, str_size);
         pontoEntradaMultiagente = FileReadString(arquivo, str_size);
         takeProfitMultiagente = FileReadString(arquivo, str_size);
         stopLossMultiagente = FileReadString(arquivo, str_size);
         FileClose(arquivo);
     }
     
      if(((double)pontoEntradaMultiagente > Bid && (double)pontoEntradaMultiagente < Ask)){  
         venda_1 = true;    
      }
      
      if(venda_1 == true && OrdersTotal() == 0){
         realizaVendaOrdem1();
      }
      else{
         venda_1 = false;
      }
      
      exibeInformacaoNaTela();
        
        
     gravaHistorico("historico.txt");   
     gravaDados("M1.csv", PERIOD_M1); 
     gravaDados("M5.csv", PERIOD_M5); 
     gravaDados("M15.csv", PERIOD_M15); 
     gravaDados("M30.csv", PERIOD_M30); 
     gravaDados("H1.csv", PERIOD_H1);
     gravaDados("H4.csv", PERIOD_H4); 
     gravaDados("D1.csv", PERIOD_D1);
     gravaDados("MN1.csv", PERIOD_MN1);   
     gravaDados("W1.csv", PERIOD_W1);   
     
   return 0;
}

void realizaVendaOrdem1(){ 
   ticketOrdem1 = OrderSend(Symbol(),OP_SELL,(double)alavancaMultiagente,Bid,0,(double)stopLossMultiagente,
                  (double) takeProfitMultiagente,nome,AccountNumber(),0,Red); 
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
       "             EXPERT INVEST_MVC OFICIAL"+"\n",
       "\___________________________________/"+"\n",
       "    Tipo de operação  = ", tipoOperacaoMultiagente+"\n",
       "    Alavancagem  = ", alavancaMultiagente+"\n",
       "\___________________________________/"+"\n",
       "    Ponto de Entrada  = ", pontoEntradaMultiagente+"\n", 
       "\___________________________________/"+"\n",
       "    Take profit  = ", takeProfitMultiagente+"\n", 
       "    Stop loss  = ", stopLossMultiagente+"\n", 
       "\___________________________________/"+"\n",
      ""
   );
}

void gravaHistorico(string nomeArquivo){

   int arquivo=FileOpen(nomeArquivo,FILE_TXT|FILE_WRITE,' ');
   
    /* 
   while(!FileIsEnding(arquivo)){
         Print(FileReadString(arquivo));
   }
   */
   
   
   if(OrderType() == 1)
      tipoOperacao = "SELL";
   if(OrderType() == -1)
      tipoOperacao = "BUY";
   
   FileWrite(arquivo,
      OrderTicket() ,
      +OrderOpenTime() ,
      +OrderCloseTime() ,
      +tipoOperacao,
      +OrderOpenPrice() ,
      +OrderClosePrice() ,
      +OrderTakeProfit ()
   );

   FileClose(arquivo);
}
 
void gravaDados(string nomeArquivo, int tipoGrafico){
   //int candlesNoGrafico=Bars-IndicatorCounted();

   int arquivo=FileOpen(nomeArquivo,FILE_CSV|FILE_WRITE,';');
   
   /*
   while(!FileIsEnding(arquivo)){
         Print(FileReadString(arquivo));
   }
   */
    
   for(int i = 0; i < 277; i++){
      if(arquivo > 0 && (TimeSeconds(Time[i]) == 0 || TimeSeconds(Time[i]) == 1)){
            FileWrite(arquivo,
                           //TimeDay(Time[i])+"/"
                           //+TimeMonth(Time[i])+"/"
                           //+TimeYear(Time[i])
                           //+" "+TimeHour(Time[i])+":"
                           //+TimeMinute(Time[i])+":"
                           NormalizeDouble(iOpen("EURUSD",tipoGrafico,i),6)
                      );
       } 
   }
   
    FileClose(arquivo);
}
