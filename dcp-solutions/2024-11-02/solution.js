```javascript
function isValid(board, row, col, num) {
    // Check if the number already exists in the row or column
    for (let i = 0; i < 9; i++) {
        if (board[row][i] === num || board[i][col] === num) {
            return false;
        }
    }

    // Check the box that the number belongs to
    let boxRow = Math.floor(row / 3) * 3;
    let boxCol = Math.floor(col / 3) * 3;
    for (let i = boxRow; i < boxRow + 3; i++) {
        for (let j = boxCol; j < boxCol + 3; j++) {
            if (board[i][j] === num) {
                return false;
            }
        }
    }

    // If we have not returned false, then the number is valid
    return true;
}

function solveSudoku(board) {
    for (let i = 0; i < 9; i++) {
        for (let j = 0; j < 9; j++) {
            if (board[i][j] === 0) { // Find an empty space
                for (let num = 1; num <= 9; num++) {
                    if (isValid(board, i, j, num)) {
                        board[i][j] = num;
                        if (solveSudoku(board)) {
                            return true;
                        } else {
                            board[i][j] = 0; // We were wrong so reset it
                        }
                    }
                }

                // If we could not find a number that works, this space will stay as 0 and we will move on to the next one
                return false;
            }
        }
    }

    return true;
}

function printBoard(board) {
    for (let i = 0; i < 9; i++) {
        if (i % 3 === 0 && i !== 0) {
            console.log("- - - - - - - - - - -");
        }

        let row = "";
        for (let j = 0; j < 9; j++) {
            if (j % 3 === 0 && j !== 0) {
                row += " | ";
            }
            if (j === 8) {
                row += board[i][j];
            } else {
                row += board[i][j] + " ";
            }
        }
        console.log(row);
    }
}
```