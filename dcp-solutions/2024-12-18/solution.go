```markdown
package main

import (
	"fmt"
)

func longestConsecutive(nums []int) int {
	if len(nums) == 0 {
		return 0
	}

	numSet := make(map[int]bool)
	for _, num := range nums {
		numSet[num] = true
	}

	maxLength := 0
	for num := range numSet {
		if !numSet[num-1] {
			currentNum, currentLen := num, 1
			for numSet[currentNum+1] {
				currentNum, currentLen = currentNum + 1, currentLen + 1
			}
			maxLength = max(maxLength, currentLen)
		}
	}

	return maxLength
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
```