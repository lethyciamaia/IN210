
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include "cmocka.h"
#include <string.h>
#include "ratp.h"

/* A test case that does nothing and succeeds. */

static int setup(void **state) {
    (void) state;
    printf("setUp");
 return 0;
}
static int teardown(void **state) {
    (void) state;
    printf("tearDown");
     return 0;
}
static void null_test_success(void **state) {
    (void) state;
}

// static void test_price_invalide_age_error() {
//     float actualPrice;
//     actualPrice = computePrice(-1, 0);
//     //tem que dar erro -- ver como faz isso
// }
static void test_price_12yo_local() {
    float actualPrice;
    actualPrice = computePrice(12, 0);
    assert_float_equal (0.75, actualPrice, 0.001);
}
static void test_price_12yo_turist() {
    float actualPrice;
    actualPrice = computePrice(12, 1);
    assert_true(actualPrice == 1.5); // Q2
    // assert_float_equal (1.5, actualPrice, 0.001);
}
static void test_price_13yo_local() {
    float actualPrice;
    actualPrice = computePrice(13, 0);
    assert_float_equal (1.5, actualPrice, 0.001);
}
static void test_price_13yo_turist() {
    float actualPrice;
    actualPrice = computePrice(13, 1);
    assert_float_equal (3, actualPrice, 0.001);
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(null_test_success),
        cmocka_unit_test(test_price_12yo_local),
        cmocka_unit_test(test_price_12yo_turist),
        cmocka_unit_test(test_price_13yo_local),
        cmocka_unit_test(test_price_13yo_turist),
    };
 //   cmocka_set_message_output(CM_OUTPUT_XML);
    return cmocka_run_group_tests_name("toto",tests, setup, teardown);
}



