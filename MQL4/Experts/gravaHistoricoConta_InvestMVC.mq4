//+------------------------------------------------------------------+
//|                                               gravaDados_CSG.mq4 |
//|                           Copyright 2014, Cleiton da Silva Gomes |
//|                                    http://www.softwarecsg.com.br |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, Cleiton da Silva Gomes"
#property link      "http://www.softwarecsg.com.br"


int start(){
   gravaHistorico("historico.txt");   
   return(0);
}

void gravaHistorico(string nomeArquivo){

   int arquivo=FileOpen(nomeArquivo,FILE_CSV|FILE_WRITE,' ');
   string tipoOperacao;
   
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
          
   Comment(
      "Ticket = ", OrderTicket() +"\n",
      "Tempo abertura = ", OrderOpenTime() +"\n",
      "Tempo fechamento = ", OrderCloseTime() +"\n",
      "Preço abertura = ", OrderOpenPrice()+"\n",
      "Preço fechamento = ", OrderClosePrice()+"\n",
      "Resultado da ordem = ", OrderTakeProfit() +"\n",
      ""
   );

   FileClose(arquivo);
}
 