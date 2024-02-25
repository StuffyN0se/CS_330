#ifndef __asgn4__
#define __asgn4__
/* the two lines above check to ensure
we haven't already included this header*/


/* ========================================================================= */
/* ~~~~~~~~~~~~~~~~~~~~~ your functions go here ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* Note: main() goes in the asgn4.c file                                     */

void insertionSort(int arr[], int size){
    for (int i = 1; i < size; i++){
        int key = *(arr + i);
        int j = i - 1;

        while (j >= 0 && arr[j] > key) {

            arr[j + 1] = *(arr + j);
            j -= 1;
        }
        arr[j + 1] = key;
    }

}

void selectionSort(int array[], int size)
    {
        for(int i = 0; i < size -1; i++){
            int minValue = i;

            for (int j = i + 1; j < size; j++){
                if (*(array + j)  < *(array + minValue))
                    minValue = j;
                if (minValue != i)
                    {
                        int temp = *(array + i);
                        array[i] = *(array + minValue);
                        array[minValue] = temp;
                    }
            }
        }
    }












#endif