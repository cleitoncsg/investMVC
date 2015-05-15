import Fibonacci(fibonacci)
import CorrelacaoDePearson(correlacao)
import MinimosQuadrados(minimosQuadradosA, minimosQuadradosB)
import System.IO

escreveFibonacci = do
	limparArquivo "fibonacciResposta.txt"
	arquivo <- openFile "fibonacciResposta.txt" AppendMode
	hPrint arquivo (fibonacci 0.38)
	hClose arquivo

escreveCorrelacao = do
	limparArquivo "correlacaoResposta.txt"
	arquivo <- openFile "correlacaoResposta.txt" AppendMode
	hPrint arquivo correlacao
	hClose arquivo

escreveMinimosQuadrados = do
	limparArquivo "minimosQuadradosResposta.txt"
	arquivo <- openFile "minimosQuadradosResposta.txt" AppendMode
	hPrint arquivo minimosQuadradosA
	hPrint arquivo minimosQuadradosB
	hClose arquivo

limparArquivo nomeArquivo = writeFile nomeArquivo ""

	