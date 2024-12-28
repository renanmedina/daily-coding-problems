```go
package main

import (
    "fmt"
)

func numDecodings(s string) int {
    if len(s) == 0 {
        return 0
    }
    
    n := len(s)
    
    // dp[i] represents the number of ways to decode s[:i]
    dp := make([]int, n+1)
    dp[0] = 1
    dp[1] = 1
    
    for i := 2; i <= n; i++ {
        if s[i-1] != '0' {
            // If the last digit can be decoded independently
            dp[i] += dp[i-1]
        }
        
        // If the last two digits together can be decoded
        if i >= 2 && (s[i-2] == '1' || (s[i-2] == '2' && s[i-1] <= '6')) {
            dp[i] += dp[i-2]
        }
    }
    
    return dp[n]
}

func main() {
    
}