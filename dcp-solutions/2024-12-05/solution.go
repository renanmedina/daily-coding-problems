```markdown
package main

import (
	"fmt"
)

func minRemoveToMakeValid(s string) int {
	stack := []byte{}
	count := 0
	for _, r := range s {
		if r == '(' {
			stack = append(stack, r)
		} else if len(stack) > 0 && stack[len(stack)-1] == '(' {
			stack = stack[:len(stack)-1]
		} else {
			count++
		}
	}

	return count + len(stack)
}
```