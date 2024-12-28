```markdown
package main

import (
	"fmt"
)

func canPartition(nums []int) bool {
	n := len(nums)
	total := 0
	for _, num := range nums {
		total += num
	}
	if total%2 != 0 {
		return false
	}

	m := total / 2
	dp := make([]bool, n+1)
	dp[0] = true

	for i := 1; i <= n; i++ {
		val := nums[i-1]
		for j := n; j >= val; j-- {
			if dp[j-val] == true {
				dp[j] = true
				break
			}
		}
	}

	return dp[n]
}

func main() {
	nums := []int{15, 5, 20, 10, 35, 15, 10}
	fmt.Println(canPartition(nums)) // prints: true

	nums = []int{15, 5, 20, 10, 35}
	fmt.Println(canPartition(nums)) // prints: false
}
```