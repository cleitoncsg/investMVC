
#property copyright "Copyright 2015, Cleiton Gomes."
#property link      "https://investmvc.com"
#define STOP_LOSS 250
#define TAKE_PROFIT 150

string nome = "nani";
string tipoOperacao;
int ticket;

int start(){

     int arquivo = FileOpen("decisaoFinal.txt", FILE_TXT|FILE_READ);
     string respostaOperacaoMultiagente;
     double respostaAlavancaMultiagente = 0.85;
   
     if(arquivo == NULL){
         printf("Arquivo nulo!!!\n");
     }
     else{
         printf("arquivo OK");
         int str_size=FileReadInteger(arquivo,INT_VALUE);
         
         respostaOperacaoMultiagente = FileReadString(arquivo, str_size);
         //respostaAlavancaMultiagente = FileReadDouble(arquivo, DOUBLE_VALUE);
       
         
         FileClose(arquivo);
     }
   
    
     
     if(respostaOperacaoMultiagente == "vender" && OrdersTotal() == 0){ 
   
         RefreshRates();   
         while (IsTradeContextBusy()) Sleep(5);
         
         ticket = OrderSend(Symbol(),OP_SELL,respostaAlavancaMultiagente,Bid,0,Bid + STOP_LOSS*Point,
                     Bid - TAKE_PROFIT*Point,nome,AccountNumber(),0,Red); 
                     
         printf("Entrou venda\n");
     }
     
     if(respostaOperacaoMultiagente == "comprar" && OrdersTotal() == 0){ 
   
         RefreshRates();   
         while (IsTradeContextBusy()) Sleep(5);
         
         ticket = OrderSend(Symbol(),OP_BUY,respostaAlavancaMultiagente ,Ask,0,Bid - STOP_LOSS*Point,
                        Ask + TAKE_PROFIT*Point,nome,AccountNumber(),0,Yellow);
     }
     /*
     if(OrdersTotal() == 1){
         respostaAlavancaMultiagente = "aguardando ou no mercado";
         respostaOperacaoMultiagente = "aguardando ou no mercado";
     
     }
     */
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
      Comment(
       "\___________________________________/"+"\n",
       " O QUE DEVE SER FEITO?  = ",  respostaOperacaoMultiagente+"\n",
       " QUAL ALAVANCAGEM?   = ",  respostaAlavancaMultiagente+"\n", 
       "\___________________________________/"+"\n",
      "Ticket = ", OrderTicket() +"\n",
      "Tempo abertura = ", OrderOpenTime() +"\n",
      "Tempo fechamento = ", OrderCloseTime() +"\n",
      "Preço abertura = ", OrderOpenPrice()+"\n",
      "Preço fechamento = ", OrderClosePrice()+"\n",
      "Resultado da ordem = ", OrderTakeProfit() +"\n",
      ""
   );
    
    
   return 0;
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
