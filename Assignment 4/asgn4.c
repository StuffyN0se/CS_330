#include <stdio.h>
#include "asgn4.h"

int main() {

    int sample;
    FILE *file;
    file = fopen("sample_list.txt", "r");
    
    if (file == NULL){
        printf("Cannot open file.\n");
    }
    else {

        while(fscanf(file, "%d", &sample) == 1){
            printf("Number: %d \n", sample);
            return 1;
        }
        fclose(file);
    }

    int test[] = {3,4,6,78,1,55,87};
    int size = *(&test + 1) - test;


    // insertionSort(test, size );
    // selectionSort(test, size);

    for(int i = 0; i< size; i++){
        printf("a[%d] = %d\n", i, *(test + i));
    }

return 0;

}