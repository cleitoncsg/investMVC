import Test.HUnit
import MinimosQuadrados

testaNumeradorVazio :: Test
testaNumeradorVazio = TestCase (assertEqual "Numerador com lista vazia" 0 (numerador [] []))

testaDenominadorVazio :: Test
testaDenominadorVazio = TestCase (assertEqual "Denominador com lista vazia" 0 (denominador []))

suiteDeTeste :: Test
suiteDeTeste = TestList [testaNumeradorVazio, testaDenominadorVazio]

main :: IO Counts
main = runTestTT suiteDeTeste
