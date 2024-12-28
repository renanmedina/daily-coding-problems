```go
package main

import (
	"sort"
)

func minColumnsToRemove(matrix [][]byte) int {
	var rows, cols = len(matrix), len(matrix[0])
	sort.SliceStable(matrix, func(i, j int) bool {
		for k := range matrix[i] {
			if matrix[i][k] != matrix[j][k] {
				return matrix[i][k] < matrix[j][k]
			}
		}
		return false
	})

	for col := range matrix[0] {
		for row := 1; row < rows; row++ {
			if matrix[row-1][col] > matrix[row][col] {
				return cols - 1
			}
		}
	}
	return 0
}

func main() {}
```