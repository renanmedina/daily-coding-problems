```c
#include <stdio.h>
#include <stdlib.h>

void find_subarray(int nums[], int size, int K) {
    int left = 0;
    int current_sum = 0;
    int* result = NULL;

    for (int right = 0; right < size; right++) {
        current_sum += nums[right];

        while (current_sum > K && left <= right) {
            current_sum -= nums[left];
            left++;
        }

        if (current_sum == K) {
            if (!result || right - left + 1 < result[2] - result[1] + 1) {
                int* temp = (int*)malloc(sizeof(int) * 3);
                temp[0] = left;
                temp[1] = right;
                temp[2] = right - left + 1;

                if (!result || temp[2] > result[2]) {
                    free(result);
                    result = temp;
                }
            }
        }
    }

    if (result) {
        printf(" [%d, %d, %d]", result[0], result[1], result[2]);
    } else {
        printf("[]");
    }
}

int main() {
    int nums[] = {1, 2, 3, 4, 5};
    int size = sizeof(nums) / sizeof(nums[0]);
    int K = 9;

    find_subarray(nums, size, K);

    return 0;
}
```