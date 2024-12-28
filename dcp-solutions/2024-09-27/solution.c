```c
#include <stdio.h>

void max_subarray_of_length_k(int* nums, int n, int k) {
    // Initialize variables to keep track of current sum and maximum sum 
    int curr_sum = 0, max_sum = INT_MIN;
    
    // Initialize a queue for storing indices
    int start = 0;
    for (int end = 0; end < k; end++) {
        curr_sum += nums[end];
        
        while (start <= end && curr_sum < 0) {
            curr_sum -= nums[start++];
        }
        
        max_sum = max(max_sum, curr_sum);
        printf("%d ", max_sum);
    }

    // Process the rest of the array
    for (int i = k; i < n; i++) {
        curr_sum = curr_sum - nums[i - k] + nums[i];
        
        if (curr_sum > max_sum) {
            max_sum = curr_sum;
        }
        printf("%d ", max_sum);
    }
}
```