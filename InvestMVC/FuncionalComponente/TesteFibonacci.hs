import Test.HUnit
import Fibonacci

testaSuporte :: Test
testaSuporte = TestCase (assertEqual "Suporte de uma lista Comum" 0 (suporte [0,1,2,3,4]))

testaResistencia :: Test
testaResistencia = TestCase (assertEqual "Resistência de uma lista Comum" 4 (resistencia [0,1,2,3,4]))

testaRetracao :: Test
testaRetracao = TestCase (assertEqual "Retração Simples" 1 (retracao 1 1 0))

suiteDeTeste :: Test
suiteDeTeste = TestList [testaRetracao,testaSuporte,testaResistencia]

main :: IO Counts
main = runTestTT suiteDeTeste

