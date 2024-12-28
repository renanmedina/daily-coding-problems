```python
def computeEditDistance(str1, str2):
    m = len(str1) + 1
    n = len(str2) + 1

    dp = [[0] * (n) for _ in range(m)]

    for i in range(m):
        dp[i][0] = i
    for j in range(n):
        dp[0][j] = j

    for i in range(1, m):
        for j in range(1, n):
            cost = 0 if str1[i - 1] == str2[j - 1] else 1
            dp[i][j] = min(dp[i - 1][j] + 1,      # Deletion
                           dp[i][j - 1] + 1,      # Insertion
                           dp[i - 1][j - 1] + cost)  # Substitution or no operation

    return dp[m - 1][n - 1]
```