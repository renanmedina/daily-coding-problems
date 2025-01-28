```c
#include <stdio.h>

void singleNumber(int* nums, int numsSize, int* result) {
    *result = 0;
    
    // XOR all numbers to find the number which appears once 
    for (int i = 0; i < numsSize; ++i)
        (*result ^= nums[i]);
        
    // Find the rightmost set bit
    int rightmost_set_bit = (*result & -(*result));
    
    // Split the result into two parts, one part at the rightmost set bit position and another at its right 
    int num1, num2;
    if ((nums[0] & rightmost_set_bit) == 0) {
        for (int i = 0; i < numsSize; ++i)
            if (!(nums[i] & rightmost_set_bit)) {
                num1 = nums[i];
                break;
            }
            
        for (int i = 0; i < numsSize; ++i)
            if ((nums[i] & rightmost_set_bit) != 0 && i != find(nums, numsSize)) {
                num2 = nums[i];
                break;
            }
    } else {
        for (int i = 0; i < numsSize; ++i)
            if ((nums[i] & rightmost_set_bit) == 0) {
                num1 = nums[i];
                break;
            }
            
        for (int i = 0; i < numsSize; ++i)
            if ((nums[i] & rightmost_set_bit) != 0 && i != find(nums, numsSize)) {
                num2 = nums[i];
                break;
            }
    }

}

int find(int* nums, int numsSize) {
    for (int i = 0; i < numsSize; ++i)
        if (nums[i] == num1 || nums[i] == num2)
            return i;
    return -1;
}
```

Note that the code is not following best practices of C, since we need to find where number appears in array which can't be done using normal indexing method.