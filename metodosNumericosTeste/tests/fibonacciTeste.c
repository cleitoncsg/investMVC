
#include <stdio.h>
#include <stdlib.h>
#include <CUnit/Basic.h>

int init_suite(void) {
    return 0;
}

int clean_suite(void) {
    return 0;
}

double calculoRegressaoFibonacci(double fatorDeRegressao, int quantidadeVelas);

void testCalculoRegressaoFibonacci() {
    double resultadoRegressaoFibonacci = calculoRegressaoFibonacci(0.23, 13);
  
    CU_ASSERT_DOUBLE_EQUAL(0.162380,resultadoRegressaoFibonacci, 0.001 );
}

double calculoResistencia(int quantidadeVelas);

void testCalculoResistencia() {
    int quantidadeVelas = 13;
    
    CU_ASSERT_DOUBLE_EQUAL(136.290,calculoResistencia(quantidadeVelas), 0.001 );
}

double calculoSuporte(int quantidadeVelas);

void testCalculoSuporte() {
     int quantidadeVelas = 13;
    
    CU_ASSERT_DOUBLE_EQUAL(136.996,calculoSuporte(quantidadeVelas), 0.001 );
}

int main() {
    CU_pSuite pSuite = NULL;

    /* Initialize the CUnit test registry */
    if (CUE_SUCCESS != CU_initialize_registry())
        return CU_get_error();

    /* Add a suite to the registry */
    pSuite = CU_add_suite("fibonacciTeste", init_suite, clean_suite);
    if (NULL == pSuite) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    /* Add the tests to the suite */
    if ((NULL == CU_add_test(pSuite, "testCalculoRegressaoFibonacci", testCalculoRegressaoFibonacci)) ||
            (NULL == CU_add_test(pSuite, "testCalculoResistencia", testCalculoResistencia)) ||
            (NULL == CU_add_test(pSuite, "testCalculoSuporte", testCalculoSuporte))) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    /* Run all tests using the CUnit Basic interface */
    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();
    CU_cleanup_registry();
    return CU_get_error();
}
