
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include "cmocka.h"
#include <string.h>
#include "ratp.h"
#include "age.h"

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

void recupAge(int *limitAge){
    *limitAge = (int)mock();
}

static void test_prix_ticket_12_nontouriste(void **state) {
    (void) state;
    float prix;
    will_return(recupAge, 12);
    prix=computePrice(12.0,0);
    assert_float_equal(0.75,prix,0.001);
}

static void test_prix_ticket_13_nontouriste(void **state) {
    (void) state;
    float prix;
    will_return(recupAge, 12);
    prix=computePrice(13.0,0);
    assert_float_equal(1.5,prix,0.001);
}

static void test_prix_ticket_12_touriste(void **state) {
    (void) state;
    float prix;
    will_return(recupAge, 12);
    prix=computePrice(12.0,1);
    assert_float_equal(1.5,prix,0.001);
}

static void test_prix_ticket_13_touriste(void **state) {
    (void) state;
    float prix;
    will_return(recupAge, 12);
    prix=computePrice(13.0,1);
    assert_float_equal(3,prix,0.001);
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_prix_ticket_12_nontouriste),
        cmocka_unit_test(test_prix_ticket_13_nontouriste),
        cmocka_unit_test(test_prix_ticket_12_touriste),
        cmocka_unit_test(test_prix_ticket_13_touriste),
    };

     //   cmocka_set_message_output(CM_OUTPUT_XML);
    return cmocka_run_group_tests_name("toto",tests, setup, teardown);



}
