```go
package main

import (
	"fmt"
)

func possibleColours(graph [][]bool, k int) bool {
	n := len(graph)
	colour := make([]int, n)
	var dfs func(int, int) bool

	dfs = func(node int, used int) bool {
		for i := 0; i < n; i++ {
			if graph[node][i] && colour[i] == used {
				return false
			}
		}
		for i := 0; i < n; i++ {
			if graph[node][i] && colour[i] == -1 {
				colour[i] = used
				if !dfs(i, used) {
					return false
				} else if used != (used+1)%k {
					return false
				}
			}
		}
		colour[node] = -1
		return true
	}

	for i := 0; i < n; i++ {
		if colour[i] == -1 {
			if !dfs(i, 0) {
				return false
			}
		}
	}

	return true
}
```