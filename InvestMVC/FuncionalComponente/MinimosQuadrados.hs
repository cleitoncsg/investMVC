module MinimosQuadrados (numerador, denominador, variacaoAngular, variacaoLinear, coeficienteAngular, coeficienteLinear) where
import ArquivosForex(cotacoes)
import CorrelacaoDePearson(calculaMedia,qtdCandles,vetorX,vetorY)

numerador [] [] = 0
numerador (cabecaX:caldaX) (cabecaY: caldaY) =
	( (cabecaX-(calculaMedia (cabecaX:caldaX)))*(cabecaY-(calculaMedia (cabecaY:caldaY))) )+ (numerador caldaX caldaY)

denominador [] = 0
denominador (cabecaX:caldaX) =
	((cabecaX - (calculaMedia (cabecaX:caldaX)))*(cabecaX - (calculaMedia (cabecaX:caldaX)))) + (denominador caldaX)

variacaoAngular (cabecaX:caldaX) (cabecaY: caldaY) =
	(numerador (cabecaX:caldaX) (cabecaY: caldaY))/(denominador (cabecaX:caldaX))

variacaoLinear (cabecaX:caldaX) (cabecaY:caldaY) =
	(calculaMedia (cabecaY:caldaY)) - ((variacaoAngular (cabecaX:caldaX) (cabecaY:caldaY)) * (calculaMedia (cabecaX:caldaX)))

coeficienteAngular = variacaoAngular (vetorX cotacoes) (vetorY cotacoes)

coeficienteLinear = variacaoLinear (vetorX cotacoes) (vetorY cotacoes)

