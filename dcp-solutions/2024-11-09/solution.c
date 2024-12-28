```c
#include <stdbool.h>

bool canPartition(int* nums, int numsSize) {
    int totalSum = 0;
    for (int i = 0; i < numsSize; i++) {
        totalSum += nums[i];
    }
    
    if (totalSum % 2 != 0) return false;
    
    bool dp[totalSum / 2 + 1][numsSize + 1] = {false};
    dp[0][0] = true;

    for (int i = 1; i <= numsSize; i++) {
        for (int j = 1; j <= totalSum / 2; j++) {
            if (j >= nums[i - 1]) {
                dp[j][i] = dp[j][i - 1] || dp[j - nums[i - 1]][i - 1];
            } else {
                dp[j][i] = dp[j][i - 1];
            }
        }
    }

    return dp[totalSum / 2][numsSize];
}
```