#include <stdio.h>
#include "asgn4.h"

int main() {

    // Opens file to read
    FILE *file = fopen("sample_list.txt", "r");

    //variable for elements and size
    int sample, sample2;
    int size = 0; 

    //Checks if file can be opened/ read
    if (file == NULL){
        printf("Cannot open file.\n");
    }
    else {
    //while there are items in list scan and add 1 to size
        while(fscanf(file, "%d", &sample) == 1){
            size++;
        }
        fclose(file);
    }

    //creates array with size found above
    int test[size];

    //opens the file a second time, this time to add the items/ elements into an array
    FILE *file2 = fopen("sample_list.txt", "r");

    //checks if it opens
    if (file2 == NULL){
        printf("Cannot open file2.\n");
    }
    else {
        int i = 0;
        //while there are elements in file, add it to array test. 
        while(fscanf(file2, "%d", &sample2) == 1){
            //starts from index 0 and adds 1 every iteration
            test[i] = sample2;
            i++;
        }
        fclose(file2);
    }

    //calls insertion and selection sort function
    insertionSort(test, size);
    selectionSort(test, size);

    // prints the elements in the array after sorted
    for(int i = 0; i< size; i++){   
        printf("a[%d] = %d\n", i, *(test + i));
    }

return 0;

}