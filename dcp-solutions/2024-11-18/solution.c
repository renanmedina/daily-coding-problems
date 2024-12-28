```c
#include <stdio.h>
#include <limits.h>

int maxProduct(int* nums, int numsSize) {
    int min1 = INT_MAX;
    int min2 = INT_MAX;

    int max_num = *nums;
    int second_max = *nums;

    for (int i = 1; i < numsSize; i++) {
        if (*nums > max_num) {
            second_max = max_num;
            max_num = *nums;
        } else if (*nums >= second_max) {
            second_max = *nums;
        }

        *nums++;
    }

    return (max_num * min1 * min2);
}
```