```go
package main

import (
	"fmt"
	"strings"
)

func longestAbsolutePath(s string) int {
	stack := []string{}
	res := 0

	for _, v := range strings.Split(s, "\n") {
		if len(v) == 0 {
			continue
		}

		v = strings.TrimLeft(v, "\t")
		if v[0] == '=' {
			for len(stack) > 1 && stack[len(stack)-1][0] != '=' {
				res = max(res, len(strings.Join(stack[:len(stack)-1], "/")) + 1 + len(v))
				stack = stack[:len(stack)-1]
			}
			if len(stack) == 1 {
				res = max(res, len(stack[0]) + len(v) + 1)
			} else {
				res = max(res, len(strings.Join(stack, "/")) + 1 + len(v))
			}
			stack = stack[:0]
		} else if v != "" && v[0] != '/' {
			stack = append(stack, v)
		}
	}

	return res
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func main() {

}
```