import Test.HUnit
import CorrelacaoDePearson

testaMedia :: Test
testaMedia = TestCase (assertEqual "Média Comum" 1 (calculaMedia [1,1,1]))

testaMediaZero :: Test
testaMediaZero = TestCase (assertEqual "Média Com lista vazia" 0 (calculaMedia []))

testaVetorX :: Test
testaVetorX = TestCase (assertEqual "Vetor X passando [1,2,4,8]" [1,4] (vetorX [1,2,4,8]))

testaVetorY :: Test
testaVetorY = TestCase (assertEqual "Vetor Y passando [1,2,4,8]" [2,8] (vetorY [1,2,4,8]))



suiteDeTeste :: Test
suiteDeTeste = TestList [testaMedia,testaMediaZero, testaVetorX,testaVetorY]

main :: IO Counts
main = runTestTT suiteDeTeste
