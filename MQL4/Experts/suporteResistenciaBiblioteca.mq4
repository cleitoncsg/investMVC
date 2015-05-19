#property copyright "Copyright 2014,  Cleiton Gomes"
#property link      "cleitoncsg@gmail.com"

#define QUANTIDADE_CANDLES 55

double resistencia(){
   double maior = -99;
   
   for(int i = 0; i < QUANTIDADE_CANDLES;i++){
      if(Open[i] > maior)
         maior = Open[i];
   }
   
   return maior;
}

double suporte(){
   double menor = 99;
   
   for(int i = 0; i < QUANTIDADE_CANDLES;i++){
      if(Close[i] < menor)
         menor = Close[i];
   }
   
   return menor;
}

bool mercadoCaindoOuSubindo(){

   int indiceResistencia, indiceSuporte;
   double maior = -99, menor = 99;
   
   for(int i = 0; i < QUANTIDADE_CANDLES;i++){
      if(Open[i] > maior){
         maior = Close[i];
         indiceResistencia = i;
      }
      if(Open[i] < menor){
         menor = Close[i];
         indiceSuporte = i;
      }
   }
   
   if(indiceSuporte < indiceResistencia)
      return true;
   else
      return false;
}
