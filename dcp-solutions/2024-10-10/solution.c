```c
#include <stdio.h>
#include <string.h>

int min(int a, int b) {
    if (a < b)
        return a;
    else
        return b;
}

int edit_distance(const char* str1, const char* str2) {
    int m = strlen(str1);
    int n = strlen(str2);

    // Create a table to store results of sub-problems
    int dp[m + 1][n + 1];

    for (int i = 0; i <= m; i++)
        dp[i][0] = i;
    for (int j = 0; j <= n; j++)
        dp[0][j] = j;

    // Fill dp[][] in bottom up manner
    for (int i = 1; i <= m; i++) {
        for (int j = 1; j <= n; j++) {
            int cost = (str1[i - 1] == str2[j - 1]) ? 0 : 1;
            dp[i][j] = min(dp[i - 1][j] + 1,     // Deletion
                           min(dp[i][j - 1] + 1,     // Insertion
                               dp[i - 1][j - 1] + cost);    // Substitution or no operation
        }
    }

    return dp[m][n];
}
```