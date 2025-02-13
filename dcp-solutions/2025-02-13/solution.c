```c
#include <stdio.h>

int min_squares(int n) {
    int dp[n + 1] = {0};
    dp[0] = 0;
    
    for (int i = 1; i <= n; i++) {
        int j = 1;
        while (j * j <= i) {
            dp[i] = dp[i] < dp[i - j * j] + 1 ? dp[i] : dp[i - j * j] + 1;
            j += 1;
        }
    }
    
    return dp[n];
}
```