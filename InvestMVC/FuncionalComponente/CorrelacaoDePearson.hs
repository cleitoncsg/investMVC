module CorrelacaoDePearson(calculaMedia,vetorX,vetorY,qtdCandles,somaQuadradoVetor)where
import System.IO
import Foreign.Marshal.Unsafe
import ArquivosForex(cotacoes,detectaQuantidadeCandle)


intToFloat :: Int -> Float
intToFloat n = fromIntegral n ::Float

calculaMedia [] = 0
calculaMedia (cabeca:calda) = sum (cabeca:calda) / fromIntegral(length (cabeca:calda))

vetorX [] = []
vetorX (cabeca : calda) =  init (cabeca : calda)

vetorY [] = []
vetorY (cabeca : calda) = tail (cabeca : calda)

vetorXY [] [] = 0
vetorXY (cabecaX : caldax) (cabecaY : calday) = (cabecaX*cabecaY) + (vetorXY caldax calday)

somaQuadradoVetor [] = 0;
somaQuadradoVetor (cabeca:calda) = (cabeca*cabeca) + (somaQuadradoVetor calda)

somaAbcissas = sum(vetorX cotacoes)
somaAbcissasQuadrado = somaQuadradoVetor (vetorX cotacoes)
somaOrdenadas = sum (vetorY cotacoes)
somaOrdenadasQuadrado = somaQuadradoVetor (vetorY cotacoes)
xy = vetorXY (vetorX cotacoes) (vetorY cotacoes)
qtdCandles = intToFloat (unsafeLocalState detectaQuantidadeCandle)

numerador = (qtdCandles*xy)-(somaAbcissas*somaOrdenadas)
denominador =sqrt( ( (qtdCandles*somaAbcissasQuadrado)-(somaAbcissas*somaAbcissas) )*((qtdCandles*somaOrdenadasQuadrado)-(somaOrdenadas*somaOrdenadas)) )

correlacao = numerador / denominador