```c
#include <stdio.h>

int maxSubArraySum(int arr[], int size);
int maxSubArraySumUtil(int arr[], int low, int high, int curr_sum);

int maxSubArraySum(int arr[], int size) {
    return maxSubArraySumUtil(arr, 0, size - 1, 0);
}

int maxSubArraySumUtil(int arr[], int low, int high, int curr_sum) {
    if (low == high)
        return curr_sum;

    int mid = low + (high - low) / 2;
    int left_max = maxSubArraySumUtil(arr, low, mid, curr_sum);
    int right_max = maxSubArraySumUtil(arr, mid + 1, high, curr_sum + arr[mid]);
    int temp_max = maxSubArraySumUtil(arr, mid + 1, high, arr[mid]);

    return (temp_max > left_max && temp_max > right_max) ? temp_max : (left_max > right_max) ? left_max : right_max;
}
```