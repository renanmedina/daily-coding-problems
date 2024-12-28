```c
#include <stdio.h>
#include <stdbool.h>

int numKnightTours(int n) {
    bool board[n][n] = {{false}};
    int xMoves[8] = {2, 1, -1, 2, -2, 1, -1, -2};
    int yMoves[8] = {1, 2, 2, 1, -1, -2, -2, -1};

    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 13; // manually counted
    }

    int movesLeft = n * n;

    board[0][0] = true;
    movesLeft--;

    for (int moveIndex = 0; moveIndex < 8 && movesLeft > 0; moveIndex++) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (!board[i][j] && canVisit(i, j, board, xMoves, yMoves)) {
                    bool isValidMove = true;
                    int movesLeftTemp = movesLeft;

                    moveKnight(board, i, j, xMoves, yMoves);
                    while (movesLeftTemp > 0) {
                        if (!isValidMove) {
                            break;
                        }
                        movesLeftTemp--;
                        for (int moveIndex2 = 0; moveIndex2 < 8 && movesLeftTemp > 0; moveIndex2++) {
                            int newX = i + xMoves[moveIndex2];
                            int newY = j + yMoves[moveIndex2];
                            if (!isWithinBounds(newX, newY, n) || board[newX][newY]) {
                                isValidMove = false;
                                break;
                            }
                            movesLeftTemp--;
                        }
                    }

                    if (isValidMove && movesLeftTemp == 0) {
                        return 1;
                    } else if (movesLeftTemp > 0) {
                        moveKnightBackward(board, i, j, xMoves, yMoves);
                    }
                }
            }
        }
    }

    return 0;
}

bool canVisit(int i, int j, bool board[10][10], int xMoves[8], int yMoves[8]) {
    for (int moveIndex = 0; moveIndex < 8; moveIndex++) {
        if (i + xMoves[moveIndex] >= 0 && i + xMoves[moveIndex] < 10 &&
            j + yMoves[moveIndex] >= 0 && j + yMoves[moveIndex] < 10) {
            return false;
        }
    }

    return true;
}

void moveKnight(bool board[10][10], int i, int j, int xMoves[8], int yMoves[8]) {
    for (int moveIndex = 0; moveIndex < 8; moveIndex++) {
        int newX = i + xMoves[moveIndex];
        int newY = j + yMoves[moveIndex];

        if (newX >= 0 && newX < 10 && newY >= 0 && newY < 10) {
            board[newX][newY] = true;
            break;
        }
    }
}

void moveKnightBackward(bool board[10][10], int i, int j, int xMoves[8], int yMoves[8]) {
    for (int moveIndex = 7; moveIndex >= 0; moveIndex--) {
        if (i + xMoves[moveIndex] < 0 || i + xMoves[moveIndex] >= 10 ||
            j + yMoves[moveIndex] < 0 || j + yMoves[moveIndex] >= 10) {
            continue;
        }

        board[i + xMoves[moveIndex]][j + yMoves[moveIndex]] = false;
    }
}

bool isWithinBounds(int i, int j, int n) {
    return (i >= 0 && i < n && j >= 0 && j < n);
}
```