```c
#include <stdio.h>

int numDecodings(char* s) {
    int n = strlen(s);
    if (s[0] == '0') return 0;
    int* dp = malloc((n + 1) * sizeof(int));
    dp[0] = 1;
    dp[1] = 1;

    for (int i = 2; i <= n; i++) {
        if (s[i - 1] != '0') dp[i] += dp[i - 1];
        if (s[i - 2] != '0' && s[i - 1] != '0') dp[i] += dp[i - 2];
    }
    free(dp);
    return dp[n];
}
```