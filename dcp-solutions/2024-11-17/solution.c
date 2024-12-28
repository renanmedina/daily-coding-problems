```c
#include <stdio.h>
#include <stdbool.h>

typedef struct {
    int row;
    int col;
} Bishop;

int numBishops(int M, Bishop bishops[][M]) {
    bool board[M][M] = {{false}};
    
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < M; j++) {
            if (bishops[i][j].row != -1 && bishops[i][j].col != -1) {
                board[bishops[i][j].row][bishops[i][j].col] = true;
            }
        }
    }

    int pairs = 0;
    
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < M; j++) {
            if (board[i][j]) {
                Bishop bishop1 = {i, j};
                bool attacked = false;

                // Right Diagonal
                int rightDiagonalRow = i + 1;
                int rightDiagonalCol = j + 1;
                while (rightDiagonalRow < M && rightDiagonalCol < M) {
                    if (board[rightDiagonalRow][rightDiagonalCol]) {
                        Bishop bishop2 = {rightDiagonalRow, rightDiagonalCol};
                        if (bishop1.row == bishop2.row || bishop1.col == bishop2.col) {
                            attacked = true;
                            break;
                        }
                    }
                    rightDiagonalRow += 1;
                    rightDiagonalCol += 1;
                }

                // Left Diagonal
                int leftDiagonalRow = i + 1;
                int leftDiagonalCol = j - 1;
                while (leftDiagonalRow < M && leftDiagonalCol >= 0) {
                    if (board[leftDiagonalRow][leftDiagonalCol]) {
                        Bishop bishop2 = {leftDiagonalRow, leftDiagonalCol};
                        if (bishop1.row == bishop2.row || bishop1.col == bishop2.col) {
                            attacked = true;
                            break;
                        }
                    }
                    leftDiagonalRow += 1;
                    leftDiagonalCol -= 1;
                }

                if (attacked) pairs++;
            }
        }
    }

    return pairs / 2;
}
```