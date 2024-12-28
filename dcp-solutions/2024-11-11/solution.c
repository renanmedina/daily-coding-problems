```c
#include <stdlib.h>

int uniquePaths(int N, int M) {
    int dp[2][M + 1] = {{0}};
    
    for (int i = 0; i < N; i++) {
        int *temp = &dp[i % 2][0];
        temp[i / 2] = 1;
        
        for (int j = 1; j <= M; j++) {
            if (i == 0 && j == 0) continue;
            temp[j] += dp[(i + 1) % 2][j - 1] + dp[i % 2][j];
        }
    }
    
    return dp[N % 2][M];
}
```