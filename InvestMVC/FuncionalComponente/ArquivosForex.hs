module ArquivosForex (stringFromFloat,obtemTipoGrafico, lerCotacoes, detectaQuantidadeCandle,cotacoes, tendencia) where

import System.IO
--import Control.Monad
import Foreign.Marshal.Unsafe

stringFromFloat :: [String] -> [Float]
stringFromFloat = map read

obtemTipoGrafico = do
    arquivoForex <- openFile "../criterioEntrada.txt" ReadMode
    contents <- hGetContents arquivoForex
    let singlewords = words contents
    let calda = tail singlewords
    let tipoGrafico = head calda
    return tipoGrafico

lerCotacoes = do
        let grafico = caminhhoDoCSV
        let listaDeCotacoes = []
        arquivoForex <- openFile grafico ReadMode
        conteudo <- hGetContents arquivoForex
        let listaDePalavras = words conteudo
            listaDeCotacoes = stringFromFloat listaDePalavras
        return listaDeCotacoes

detectaQuantidadeCandle = do
    arquivoForex <- openFile "../criterioEntrada.txt" ReadMode
    conteudo <- hGetContents arquivoForex
    let listaDePalavras = words conteudo
    let candle = read (last (init listaDePalavras))
    return candle

tendencia = do
    arquivoForex <- openFile "../tendencia.txt" ReadMode
    conteudo <- hGetContents arquivoForex
    return (read conteudo :: Float)

caminhhoDoCSV = "../../MQL4/Files/"++(unsafeLocalState obtemTipoGrafico)++".csv"

cotacoes = take ((unsafeLocalState detectaQuantidadeCandle)+1) (unsafeLocalState lerCotacoes)

