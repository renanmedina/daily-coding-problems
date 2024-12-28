```c
#include <stdio.h>
#include <stdlib.h>

int canBeNonDecreasing(int* nums, int numsSize) {
    if (numsSize <= 2) return 1;
    int increasing = 0;
    for (int i = 0; i < numsSize - 1; i++) {
        if (nums[i] > nums[i + 1]) {
            if (increasing == 0) {
                increasing++;
                if (i != 0 && nums[i - 1] > nums[i + 1])
                    return 0;
            } else if (increasing == 1) return 0;
        }
    }
    return 1;
}
```