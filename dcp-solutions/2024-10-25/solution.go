```markdown
package main

import (
    "fmt"
)

func longestPalindromicSubstring(s string) string {
    if len(s) == 0 {
        return ""
    }

    maxLen := 1
    start := 0

    for i := 0; i < len(s); i++ {
        len1 := expandAroundCenter(s, i, i)
        len2 := expandAroundCenter(s, i, i+1)

        len3 := min(len1, len2)
        if len3 > maxLen {
            start = i - (len3 - 1) / 2
            maxLen = len3
        }
    }

    return s[start:start+maxLen]
}

func expandAroundCenter(s string, left, right int) int {
    for left >= 0 && right < len(s) && s[left] == s[right] {
        left--
        right++
    }
    return right - left - 1
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
```