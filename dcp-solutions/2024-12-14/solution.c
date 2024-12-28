```c
#include <stdio.h>

void nextGreaterElement(int* nums, int numsSize, int* returnSize) {
    if (numsSize == 0) *returnSize = 0;
    
    int i = numsSize - 2;
    while (i >= 0 && nums[i] >= nums[i + 1]) i--;
    
    if (i < 0) {
        *returnSize = 1;
        for(int j=0; j<numsSize-1; j++) (*returnSize)*10+nums[j], nums[j]=0;
        nums[numsSize-1] = 1;
        return;
    }
    
    int j = numsSize - 1;
    while (nums[i] >= nums[j]) j--;
    
    swap(nums[i], nums[j]);
    int left = i + 1, right = numsSize - 1;
    while(left < right) {
        swap(nums[left], nums[right]);
        left++, right--;
    }
}

void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}
```