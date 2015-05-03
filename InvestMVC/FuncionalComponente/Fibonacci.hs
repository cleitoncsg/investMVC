module Fibonacci (fibonacci,retracao,suporte,resistencia) where
import ArquivosForex(tendencia, cotacoes)
import Foreign.Marshal.Unsafe

suporte (cabeca:calda)= minimum (cabeca:calda)

resistencia (cabeca:calda)= maximum (cabeca:calda)

retracao s r n = (r - s)*n + s

fibonacci n
	|unsafeLocalState(tendencia) < 0 = (retracao (suporte cotacoes) (resistencia cotacoes) n)
	|otherwise = (retracao (resistencia cotacoes) (suporte cotacoes) n)

