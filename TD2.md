# IN210 TD2

## Groupe

* Augusto MIRANDA DE PAULA
*  Lethycia Maia
*  Hairiya Guidado

## EX1
static void test_prix_ticket_12_touriste(void **state) {
    prix=computePrice(12.0,1);
    assert_float_equal(1.5,prix,0.001);
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(null_test_success),
        cmocka_unit_test(test_prix_ticket_12_nontouriste),
    };
 //   cmocka_set_message_output(CM_OUTPUT_XML);
    return cmocka_run_group_tests_name("toto",tests);
}

Lorsque nous comparons des nombres à virgule flottante, il est important de prendre en compte les limitations de précision inhérentes à leur représentation en mémoire. Les opérations sur les nombres à virgule flottante peuvent entraîner des erreurs d'arrondi, ce qui signifie que deux nombres qui devraient être égaux dans la théorie peuvent différer légèrement en raison de ces erreurs d'arrondi.

La précision epsilon est utilisée pour spécifier la marge d'erreur acceptable lors de la comparaison de deux nombres à virgule flottante. Plutôt que de vérifier si les nombres sont exactement égaux, nous vérifions s'ils sont suffisamment proches les uns des autres, compte tenu d'une certaine marge d'erreur définie par la valeur de epsilon.

## EX2
static void test_prix_ticket_12_touriste(void **state) {
    (void) state;
    float prix=computePrice(12.0,1);
    assert_true(prix==1.5);
    assert_float_equal(1.5,prix,0.001);
}

Pour répondre à cette question, nous allons d’abord présenter une brève comparaison des deux assertions :

• assertEquals est utilisé lorsqu’on dispose d’une valeur spécifique attendue et que l’on souhaite  vérifier si la valeur retournée par une fonction est exactement égale à cette valeur attendue. Par exemple, si nous attendons un résultat précis comme 5 et que la fonction doit retourner exactement 5, alors assertEquals est approprié.
• assertTrue est utilisé lorsque nous avons une condition booléenne à vérifier. On souhaite s’assurer qu'une certaine condition est vraie. Par exemple, si on s’attend à ce que le résultat d'une fonction soit positif, Nous pouvons utiliser assertTrue pour vérifier que le résultat est supérieur à zéro.

Dans notre contexte, il est mieux d’utiliser AssertEquals parce qu’on veut se rassurer que la valeur calculée pour le prix du ticket soit égale à la valeur attendue. De plus, l’utilisation de la précision epsilon nous permet de limiter les erreurs dans nos comparaisons.

## EX4

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(null_test_success),
        cmocka_unit_test(test_prix_ticket_12_nontouriste),
        cmocka_unit_test(test_prix_ticket_13_nontouriste),
        cmocka_unit_test(test_prix_ticket_12_touriste),
        cmocka_unit_test(test_prix_ticket_13_touriste),
    };
 //   cmocka_set_message_output(CM_OUTPUT_XML);
    return cmocka_run_group_tests_name("toto",tests, setup, teardown);

Les tests logiciels servent non seulement à trouver des erreurs, mais aussi à prévenir les changements de code qui pourraient également modifier le fonctionnement des règles métier et d'autres fonctionnalités, guidant ainsi les développeurs et évitant la génération de bugs. Lorsque nous ne testons pas chaque cas individuellement, nous obtenons des résultats génériques et nous ne savons pas exactement où se situe l'erreur, ce qui rend difficile l'identification des bugs et, par conséquent, leur correction, ce qui compromet la fonction des tests en tant que type de documentation permettant le développement par des personnes différentes. En traitant chaque cas de test individuellement, nous contribuons à la robustesse, à la maintenance et à la fiabilité du code.


## EX5
CC = gcc
CFLAGS = -I. -I"." -Wall -Werror -fexceptions -fprofile-arcs -ftest-coverage
LDFLAGS = -lcmocka --coverage

SRCS = ratp.c main.c
OBJS = $(SRCS:.c=.o)

all: testAll

testAll: $(OBJS)
 $(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

%.o: %.c
 $(CC) $(CFLAGS) -c $< -o $@

clean:
 rm -f $(OBJS) testAll

mrproper:  clean
 rm ratp.g*
 rm main.g*


## EX6
void recupAge(int* age) {
    *age=(int)mock();}