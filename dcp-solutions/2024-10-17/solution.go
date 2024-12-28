```markdown
package main

import (
	"fmt"
)

func totalNQueens(n int) int {
	var result = 0
	row := make([]bool, n)
	column := make([]bool, n)
	diagonal1 := make([]bool, 2*n-1)
	diagonal2 := make([]bool, 2*n-1)

	const (
		positiveDiagonals = 0
		negativeDiagonals = 1
	)

	var placeQueen func(row int) int

	placeQueen = func(row int) int {
		if row == n {
			result++
			return
		}

		for col := 0; col < n; col++ {
			if isSafe(row, col, column, diagonal1, diagonal2) {
				column[col] = true
				diagonal1[row+col] = true
				diagonal2[row-col] = true

				rowPlaceQueen := placeQueen(row + 1)

				column[col] = false
				diagonal1[row+col] = false
				diagonal2[row-col] = false

				if rowPlaceQueen != 0 {
					result += rowPlaceQueen
				}
			}
		}

		return result
	}

	return placeQueen(0)
}

func isSafe(row int, col int, column []bool, diagonal1 []bool, diagonal2 []bool) bool {
	for i := 0; i < len(column); i++ {
		if column[i] == true {
			return false
		}
	}
	for i := 0; i < len(diagonal1); i++ {
		if diagonal1[i] == true {
			return false
		}
	}
	for i := 0; i < len(diagonal2); i++ {
		if diagonal2[i] == true {
			return false
		}
	}

columnStart:
	for i := row - 1; i >= 0; i-- {
		if column[i] == true {
			continue columnStart
		}
	}

	for i := int64(row) - int64(col); i < int64(n)+int64(row); i++ {
		if diagonal1[i-row+col] == true {
			continue columnStart
		}
	}

	for i := int64(row) + int64(col); i < int64(n)+int64(row); i++ {
		if diagonal2[i-row-col] == true {
			continue columnStart
		}
	}

	return true
}

func main() {

}