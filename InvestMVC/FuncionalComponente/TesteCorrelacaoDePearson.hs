module TesteCorrelacaoDePearson(main) where

import Test.HUnit
import CorrelacaoDePearson

testaMediaListaVazia :: Test
testaMediaListaVazia = TestCase (assertEqual "Média de lista vazia" 0 (calculaMedia []))

testaMediaLista :: Test
testaMediaLista = TestCase (assertEqual "Média de uma lista" 3 (calculaMedia [3,3,3]))

testaVetorXVazia :: Test
testaVetorXVazia = TestCase (assertEqual "Vetor X" 0 (length(vetorX [])) )

testaVetorX :: Test
testaVetorX = TestCase (assertEqual "Vetor X" [1,2,3] (vetorX [1,2,3,4]))

testaVetorYVazia :: Test
testaVetorYVazia = TestCase (assertEqual "Vetor Y" 0 (length(vetorY [])) )

testaVetorY :: Test
testaVetorY = TestCase (assertEqual "Vetor Y" [1,2,3] (vetorY [0,1,2,3]))

testaSomaQuadradoVetorVazia :: Test
testaSomaQuadradoVetorVazia = TestCase (assertEqual "Soma quadrática de uma lista vazia" 0 (somaQuadradoVetor []))

testaSomaQuadradoVetor :: Test
testaSomaQuadradoVetor = TestCase (assertEqual "Soma quadrática de uma lista [1,2,3]" 14 (somaQuadradoVetor [1,2,3]))

suiteDeTeste :: Test
suiteDeTeste = TestList [testaMediaListaVazia,testaMediaLista,testaVetorX, testaVetorXVazia, testaVetorY, testaVetorYVazia, testaSomaQuadradoVetor,testaSomaQuadradoVetorVazia]

main :: IO Counts
main = runTestTT suiteDeTeste
