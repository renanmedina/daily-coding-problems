```markdown
package main

import (
    "fmt"
    "sort"
)

func isPermutationPalindrome(s string) bool {
    s = cleanString(s)
    freq := make([]int, 26)

    for _, c := range s {
        if c >= 'a' && c <= 'z' {
            freq[c-'a']++
        }
    }

    count := 0
    for _, f := range freq {
        if f > 0 {
            count += 2
        } else if f < 0 {
            return false
        }
    }

    return count % 2 == 0 || count == 1
}

func cleanString(s string) string {
    s = s[:len(s)/2]
    for i := len(s)-1; i >= 0; i-- {
        if s[i] != s[len(s)-1-i] {
            s = s[:i] + s[len(s):i+1]
            break
        }
    }

    return s
}
```