```c
#include <stdio.h>

int minCost(int** costs, int n, int k) {
    // Base case: if no houses are to be built then total cost is 0
    if (n == 0) return 0;

    // Initialize a dp array of size Kx1
    int* dp = (int*)malloc(k * sizeof(int));
    
    // Base case for the first house
    dp[0] = costs[0][0];
    
    // Iterate through each of the remaining houses.
    for (int i = 1; i < k; i++) {
        dp[i] = costs[0][i] + dp[(i+1)%k];
    }
        
    // Fill up the dp table
    for(int h=1;h<n;h++){
        int* ndp = (int*)malloc(k * sizeof(int));
        ndp[0] = costs[h][0] + min(dp[1], dp[k-1]);
        
        // Update dp[j]
        for(int j=1;j<k;j++) {
            ndp[j] = costs[h][j] + min(dp[(j+1)%k], dp[(j-1+k)%k]);
        }
        free(dp);
        dp = ndp;
    }

    int sum = 0;
    // Return the minimum cost
    for (int i = 0; i < k; i++) {
        sum += dp[i];
    }
    
    free(dp);
    return sum;
}
```