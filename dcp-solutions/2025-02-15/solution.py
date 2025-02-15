```python
def uniquePaths(matrix):
    rows, cols = len(matrix), len(matrix[0])
    dp = [[1] * cols for _ in range(rows)]

    for row in range(1, rows):
        for col in range(1, cols):
            if matrix[row][col] == 1:
                dp[row][col] = 0
            else:
                dp[row][col] = dp[row-1][col] + dp[row][col-1]

    return dp[-1][-1]
```