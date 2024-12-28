```markdown
package main

import (
	"fmt"
)

// EditDistance calculates the minimum number of operations (insertions, deletions, substitutions)
// required to transform string `a` into string `b`.
func EditDistance(a, b []byte) int {
	m, n := len(a), len(b)
	dp := make([][]int, m+1)
	for i := range dp {
		dp[i] = make([]int, n+1)
	}

	for i := 0; i <= m; i++ {
		dp[i][0] = i
	}
	for j := 0; j <= n; j++ {
		dp[0][j] = j
	}

	for i := 1; i <= m; i++ {
		for j := 1; j <= n; j++ {
			if a[i-1] == b[j-1] {
				dp[i][j] = dp[i-1][j-1]
			} else {
				dp[i][j] = 1 + min(min(dp[i-1][j], dp[i][j-1]), dp[i-1][j-1])
			}
		}
	}

	return dp[m][n]
}

func min(nums ...int) int {
	minimum := nums[0]
	for _, num := range nums {
		if num < minimum {
			minimum = num
		}
	}
	return minimum
}

func main() {
	fmt.Println(EditDistance([]byte("kitten"), []byte("sitting")))
}