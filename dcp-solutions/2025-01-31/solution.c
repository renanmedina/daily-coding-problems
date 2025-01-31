```c
#include <stdio.h>
#include <stdlib.h>

void partition(int* nums, int numsSize, int pivot) {
    // Create three pointers for each part of the list.
    int low = 0;
    int equal = 0;
    int high = 0;

    while (high < numsSize) {

        if (nums[high] < pivot) {
            int temp = nums[low];
            nums[low] = nums[high];
            nums[high] = temp;
            low++;
            high++;

        } else if (nums[high] == pivot) {
            int temp = nums[equal];
            nums[equal] = nums[high];
            nums[high] = temp;
            equal++;
            high++;

        } else {

            int temp = nums[high];
            nums[high] = nums[equal];
            nums[equal] = temp;
            equal++;
            high++;
        }
    }

}

// Prints the elements of an array in sorted order.
void printArray(int* nums, int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", nums[i]);
    }
    printf("\n");
}

```