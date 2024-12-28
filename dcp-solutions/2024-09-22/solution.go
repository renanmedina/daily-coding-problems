```markdown
package main

import (
	"fmt"
)

func longestSubstring(s string, k int) int {
	if len(s) == 0 || k == 0 {
		return 0
	}

	var left int
	var charCount = make(map[rune]int)
	maxLength := 0

	for right, runeChar := range s {
		charCount[runeChar]++

		for size := len(charCount); size > k; {
			charCount[s[left]]--
			if charCount[s[left]] == 0 {
				delete(charCount, s[left])
			}
			left++
			size--
		}

		maxLength = max(maxLength, right-left+1)
	}

	return maxLength
}

func max(a int, b int) int {
	if a > b {
		return a
	} else {
		return b
	}
}

func main() {
	fmt.Println(longestSubstring("abcba", 2)) // prints: 5
}
```