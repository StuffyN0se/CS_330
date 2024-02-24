#ifndef __asgn4__
#define __asgn4__
/* the two lines above check to ensure
we haven't already included this header*/


/* ========================================================================= */
/* ~~~~~~~~~~~~~~~~~~~~~ your functions go here ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* Note: main() goes in the asgn4.c file                                     */
void insertionSort(int arr[], int size){
    for (int i = 0; i < size; i++){
        int key = arr[i];
        int j = i + 1;
        while (j >= 0 && arr[i] > key) {
            // int temp = arr[j + 1];
            arr[j + 1] = arr[j];
            // arr[j] = temp;
            j -= 1;
        }
        arr[j + 1] = key;
        
    }

}











#endif