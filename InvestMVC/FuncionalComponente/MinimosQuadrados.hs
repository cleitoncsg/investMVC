module MinimosQuadrados (minimosQuadradosA, minimosQuadradosB) where

import CorrelacaoDePearson(calculaMedia,vetorX,vetorY,covarianciaPearson,varianciaPearson)
import ArquivosForex(cotacoes)


b (cabeca:calda) = (covarianciaPearson (vetorX (cabeca:calda)) (vetorY (cabeca:calda)) (calculaMedia (vetorX (cabeca:calda))) (calculaMedia (vetorY (cabeca:calda))))/ (varianciaPearson (vetorX (cabeca:calda)) (calculaMedia (vetorX (cabeca:calda))) )

a (cabeca:calda) = (calculaMedia (vetorY (cabeca:calda))) -( (b (cabeca:calda)) * (calculaMedia (vetorX (cabeca:calda))) )

minimosQuadradosA = a cotacoes

minimosQuadradosB = b cotacoes
