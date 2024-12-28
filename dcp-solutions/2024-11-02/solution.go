```go
package main

import (
	"fmt"
)

func solveSudoku(board [][]int) bool {
	if isInvalid(board) {
		return false
	}

	for i := 0; i < 9; i++ {
		for j := 0; j < 9; j++ {
			if board[i][j] == 0 {
				for num := 1; num <= 9; num++ {
					if isValid(board, i, j, num) {
						board[i][j] = num
						if solveSudoku(board) {
							return true
						}
						board[i][j] = 0
					}
				}
				return false
			}
		}
	}

	return true
}

func isValid(board [][]int, row int, col int, num int) bool {
	for i := 0; i < 9; i++ {
		if board[row][i] == num || board[i][col] == num {
			return false
		}
	}

	startRow, startCol := (row/3)*3, (col/3)*3
	for i := startRow; i < startRow+3; i++ {
		for j := startCol; j < startCol+3; j++ {
			if board[i][j] == num {
				return false
			}
		}
	}

	return true
}

func isInvalid(board [][]int) bool {
	for i := 0; i < 9; i++ {
		if !isValidRow(board[i]) || !isValidCol(board, i) {
			return true
		}
	}

	return false
}

func isValidRow(row []int) bool {
	for num := 1; num <= 9; num++ {
		if contains(row, num) {
			return false
		}
	}

	return true
}

func isValidCol(board [][]int, col int) bool {
	for i := 0; i < 9; i++ {
		if !isValidRow(board[i]) {
			return false
		}
	}

	return true
}

func contains(slice []int, e int) bool {
	for _, run := range slice {
		if run == e {
			return true
		}
	}
	return false
}

func printBoard(board [][]int) {
	for i := 0; i < 9; i++ {
		for j := 0; j < 9; j++ {
			fmt.Print(board[i][j], " ")
			if (j+1)%3 == 0 && j != 8 {
				fmt.Print("|")
			}
		}
		fmt.Println()
		if (i+1)%3 == 0 && i != 8 {
			fmt.Println("- - - - - - - - - - - -")
		}
	}
}

func main() {
	board := [][]int{
		{5, 3, 0, 0, 7, 0, 0, 0, 0},
		{6, 0, 0, 1, 9, 5, 0, 0, 0},
		{0, 9, 8, 0, 0, 0, 0, 6, 0},
		{8, 0, 0, 0, 6, 0, 0, 0, 3},
		{4, 0, 0, 8, 0, 3, 0, 0, 1},
		{7, 0, 0, 0, 2, 0, 0, 0, 6},
		{0, 6, 0, 0, 0, 0, 2, 8, 0},
		{0, 0, 0, 4, 1, 9, 0, 0, 5},
		{0, 0, 0, 0, 8, 0, 0, 7, 9},
	}

	solveSudoku(board)
	fmt.Println()
	printBoard(board)

}
```