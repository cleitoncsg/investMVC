
#property copyright "Copyright 2015, Cleiton Gomes."
#property link      "https://investmvc.com"

string nome = "nani";
int ticket;

int start(){
     int arquivo = FileOpen("decisaoFinal.txt", FILE_READ);
     
     if(arquivo == NULL){
         printf("Arquivo nulo!!!\n");
     }
     else{
         printf("arquivo OK\n");
         string respostaOperacaoMultiagente = "vender";
     }
     
     int str_size=FileReadInteger(arquivo,INT_VALUE);
     //string respostaOperacaoMultiagente = FileReadString(arquivo, str_size);
    
     string respostaAlavancaMultiagente = 0.85;
     
     
     if(respostaAlavancaMultiagente == "comprar" && OrdersTotal() == 0){ 
   
         RefreshRates();   
         while (IsTradeContextBusy()) Sleep(5);
         
         ticket = OrderSend(Symbol(),OP_SELL,0.85,Bid,0,0,0,nome,AccountNumber(),0,Red);
     }
     
     if(respostaAlavancaMultiagente == "comprar" && OrdersTotal() == 0){ 
   
         RefreshRates();   
         while (IsTradeContextBusy()) Sleep(5);
         
         ticket = OrderSend(Symbol(),OP_BUY,0.85,Ask,0,0,
                       0,nome,AccountNumber(),0,Yellow);
     }
     
     
     
      Comment(
       "             INVEST_MVC"+"\n",
       
       "\___________________________________/"+"\n",
       " O QUE DEVE SER FEITO?  = vender",  +"\n",
       " QUAL ALAVANCAGEM?   = ",  respostaAlavancaMultiagente+"\n", 
       "\___________________________________/"+"\n",
      ""
   );
    
    
   return 0;
}
