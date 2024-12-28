```javascript
function totalNQueens(n) {
    let res = 0;
    function isValid(row, col) {
        for (let i = row; i >= 0; i--) {
            if (board[i] === col || 
                board[i] - i === col - row || 
                board[i] + i === col + row) return false;
        }
        return true;
    }

    function backtrack(row) {
        for (let col = 0; col < n; col++) {
            if (isValid(row, col)) {
                board[row] = col;
                if (row === n - 1) res++;
                else backtrack(row + 1);
                board[row] = null;
            }
        }
    }

    let board = new Array(n).fill(null);
    backtrack(0);
    return res;
}
```