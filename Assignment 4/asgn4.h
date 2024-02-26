#ifndef __asgn4__
#define __asgn4__
/* the two lines above check to ensure
we haven't already included this header*/


/* ========================================================================= */
/* ~~~~~~~~~~~~~~~~~~~~~ your functions go here ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* Note: main() goes in the asgn4.c file                                     */


void insertionSort(int arr[], int size){

    for (int i = 1; i < size; i++){             //loops through arrary
        int key = *(arr + i);                   //asigns key to element at index i
        int j = i - 1;                          //creates variable j with value of i - 1
        while (j >= 0 && arr[j] > key) {        //checks to see if elements from index i to index 0 is larger than key
            arr[j + 1] = *(arr + j);            //if yes swap the two everything before that point is now sorted
            j -= 1;
        }
        arr[j + 1] = key;                       //moved onto the next element
    }

}

void selectionSort(int array[], int size)
    {
        for(int i = 0; i < size -1; i++){                   //loops through list from 0 to second to last element
            int minValue = i;                               //current min is 1, starts at index 0 beginning of list

            for (int j = i + 1; j < size; j++){             //loops through from 1 to end of array
                if (*(array + j)  < *(array + minValue))    // checks to see if element at index j is smaller than element at current min
                        minValue = j;                       // if yes the min value is now index j 
            }
            if (minValue != i)                              //if min value is no longer i then we swap the two elements
                {
                    int temp = *(array + i);
                    array[i] = *(array + minValue);
                    array[minValue] = temp;
                }
        }
    }












#endif