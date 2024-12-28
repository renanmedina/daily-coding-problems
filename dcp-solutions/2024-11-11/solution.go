```markdown
package main

import "fmt"

func uniquePaths(N int, M int) int {
	d := make([][]int, N)
	for i := range d {
		d[i] = make([]int, M)
	}

	// Initialize the first row and column to 1s since we can only come from top or left
	for i := 0; i < N; i++ {
		d[i][0] = 1
	}
	for j := 0; j < M; j++ {
		d[0][j] = 1
	}

	// Calculate the number of paths for each cell
	for i := 1; i < N; i++ {
		for j := 1; j < M; j++ {
			d[i][j] = d[i-1][j] + d[i][j-1]
		}
	}

	return d[N-1][M-1]
}

func main() {
	fmt.Println(uniquePaths(2, 2)) // output: 2
	fmt.Println(uniquePaths(5, 5)) // output: 70
}
```