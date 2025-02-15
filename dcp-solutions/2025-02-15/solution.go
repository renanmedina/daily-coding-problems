```markdown
package main

import "fmt"

func uniquePaths(matrix [][]int) int {
    rows, cols := len(matrix), len(matrix[0])
    
    // Create a 2D array to store the number of ways to reach each cell.
    dp := make([][]int, rows)
    for i := range dp {
        dp[i] = make([]int, cols)
    }
    
    dp[0][0] = 1
    
    // Initialize the first row and column.
    for i := 1; i < rows; i++ {
        if matrix[i][0] == 0 {
            dp[i][0] = dp[i-1][0]
        } else {
            break
        }
    }
    
    for j := 1; j < cols; j++ {
        if matrix[0][j] == 0 {
            dp[0][j] = dp[0][j-1]
        } else {
            break
        }
    }
            
    // Fill in the rest of the 2D array.
    for i := 1; i < rows; i++ {
        for j := 1; j < cols; j++ {
            if matrix[i][j] == 0 {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            } else {
                break
            }
        }
    }
    
    return dp[rows-1][cols-1]
}
```