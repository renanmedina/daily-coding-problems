```javascript
function findWord(matrix, word) {
    const rows = matrix.length;
    const cols = matrix[0].length;

    // Check horizontally
    for (let row = 0; row < rows; row++) {
        let found = true;
        for (let col = 0; col <= cols - word.length; col++) {
            let match = true;
            for (let i = 0; i < word.length; i++) {
                if (matrix[row][col + i] !== word[i]) {
                    match = false;
                    break;
                }
            }
            if (match) return true;
        }
    }

    // Check vertically
    for (let col = 0; col < cols; col++) {
        let found = true;
        for (let row = 0; row <= rows - word.length; row++) {
            let match = true;
            for (let i = 0; i < word.length; i++) {
                if (matrix[row + i][col] !== word[i]) {
                    match = false;
                    break;
                }
            }
            if (match) return true;
        }
    }

    return false;
}
```