#include "age.h"

static const float Price = 1.5;

float computePrice(int age, int turist)
{
    int limitAge;
    int *plimit = &limitAge;

    recupAge(plimit);
    if (age>limitAge)
        return turist ? Price*2 : Price;
    else 
        return turist ? Price : Price/2;
}
