#include "age.h"
#include <stdio.h>

static const float Price = 1.5;
int limitAge;
int *plimit = &limitAge;

float computePrice(int age, int tourist)
{
    recupAge(plimit);
    printf("%d\n", limitAge);
    if (age>limitAge)
    {
        if (tourist)
            return Price*2;
        return Price;
    }
    else 
    {
        if (tourist)
            return Price;
        return Price/2;
    }
}
