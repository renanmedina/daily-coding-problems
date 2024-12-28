```c
#include <stdio.h>
#include <stdbool.h>

bool subsetSum(int* nums, int numsSize, int k, bool* res) {
    bool dp[k + 1][numsSize + 1];
    memset(dp, false, sizeof(dp));
    dp[0][0] = true;

    for (int i = 0; i < numsSize; i++) {
        for (int j = k; j >= nums[i]; j--) {
            dp[j][i + 1] = dp[j - nums[i]][i] || dp[j][i];
        }
    }

    if (!dp[k][numsSize]) return false;

    int start = numsSize;
    for (int i = k; i > 0; i--) {
        if (dp[i][start]) {
            res[start] = true;
            for (int j = start - 1; j >= 0; j--) {
                if (dp[i - nums[j]][j] && !res[j + 1]) {
                    res[j + 1] = true;
                    start = j + 1;
                }
            }
        }
    }

    return true;
}

int* subsetSumHelper(int* nums, int numsSize, int k, bool* res) {
    if (subsetSum(nums, numsSize, k, res)) {
        for (int i = 0; i < numsSize; i++) {
            if (!res[i]) continue;
            int* newNums = malloc((i + 1) * sizeof(int));
            for (int j = 0; j <= i; j++) {
                newNums[j] = nums[j];
            }
            return newNums;
        }
    } else {
        return NULL;
    }
}

int main() {
    int nums[] = {12, 1, 61, 5, 9, 2};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int k = 24;
    bool res[6];
    subsetSumHelper(nums, numsSize, k, res);
    for (int i = 0; i < 6; i++) {
        if (res[i]) printf("%d ", nums[i]); 
    }
    return 0;
}
```