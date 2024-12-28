```javascript
function computeEditDistance(str1, str2) {
    const m = str1.length;
    const n = str2.length;

    // Create a table to store results of sub-problems.
    let dp = new Array(m + 1).fill(0).map(() => new Array(n + 1).fill(0));

    // Fill dp[][] in bottom up manner
    for (let i = 0; i <= m; i++) {
        for (let j = 0; j <= n; j++) {

            // If one of the string is empty, then result is simple
            // insertion or deletion of all characters of the other string
            if (i == 0)
                dp[i][j] = j;
            else if (j == 0)
                dp[i][j] = i;

            // Check adding or removing a character
            // and store in dp[][].
            else if (str1[i-1] == str2[j-1])
                dp[i][j] = dp[i-1][j-1];

            else
                dp[i][j] = 1 + Math.min(dp[i][j-1],      // Insert
                                        dp[i-1][j],      // Remove
                                        dp[i-1][j-1]);   // Replace
        }
    }

    return dp[m][n];
}
```