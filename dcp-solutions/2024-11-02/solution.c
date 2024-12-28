```c
#include <stdbool.h>

bool isValid(int board[9][9], int row, int col, int num) {
    // Check the number in the row
    for (int x = 0; x < 9; x++) {
        if (board[row][x] == num) {
            return false;
        }
    }

    // Check the number in the column
    for (int x = 0; x < 9; x++) {
        if (board[x][col] == num) {
            return false;
        }
    }

    // Check the number in the box
    int startRow = row - row % 3;
    int startCol = col - col % 3;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (board[i + startRow][j + startCol] == num) {
                return false;
            }
        }
    }

    // If we've passed all the checks, then it's valid
    return true;
}

bool solveSudoku(int board[9][9]) {
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            if (board[i][j] == 0) {
                for (int num = 1; num <= 9; num++) {
                    if (isValid(board, i, j, num)) {
                        board[i][j] = num;
                        if (solveSudoku(board)) {
                            return true;
                        }
                        board[i][j] = 0;
                    }
                }
                return false;
            }
        }
    }

    // If we've filled in the whole grid and there are no more empty cells, then
    // it's solved
    return true;
}

// Function to print the sudoku board
void printBoard(int board[9][9]) {
    for (int i = 0; i < 9; i++) {
        if (i % 3 == 0 && i != 0) {
            printf("\n");
        }
        for (int j = 0; j < 9; j++) {
            if (j % 3 == 0 && j != 0) {
                printf(" | ");
            }
            if (j == 8) {
                printf("%d", board[i][j]);
            } else {
                printf("%d ", board[i][j]);
            }
        }
    }
    printf("\n");
}
```

This code includes a function `isValid` to check if it's valid to place a number in the given row, column or box. The main function `solveSudoku` uses backtracking to solve the Sudoku puzzle. It iterates over all empty cells (0) and tries numbers from 1 to 9. If a number is valid (i.e., `isValid` returns true), it places that number in the cell and recursively calls itself with the updated board. If it can't find a valid number for the current cell, it backtracks by resetting the cell to 0 and trying the next number.

The function `printBoard` prints the Sudoku board in a readable format.