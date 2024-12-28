```javascript
function uniquePaths(N, M) {
    let dp = Array(N).fill(0).map(() => Array(M).fill(1));
    
    for (let i = 1; i < N; i++) {
        for (let j = 1; j < M; j++) {
            dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
        }
    }

    return dp[N - 1][M - 1];
}
```