#include <stdio.h>
#include "asgn4.h"

int main() {

int test[] = {3,4,6,78,1,55,87};
// int size = sizeof(test);

insertionSort(test, 7 );

for(int i = 0; i< 7; i++){
    printf("a[%d] = %d\n", i, test[i]);
}


}