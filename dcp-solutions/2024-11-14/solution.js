```javascript
function spiralMatrix(matrix) {
    const row = matrix.length;
    const col = matrix[0].length;
    let topRow = 0;
    let bottomRow = row - 1;
    let leftCol = 0;
    let rightCol = col - 1;

    while (topRow <= bottomRow && leftCol <= rightCol) {
        for (let i = leftCol; i <= rightCol; i++) {
            process.stdout.write(matrix[topRow][i] + " ");
        }
        topRow++;

        for (let i = topRow; i <= bottomRow; i++) {
            process.stdout.write(matrix[i][rightCol] + " ");
        }
        rightCol--;

        if (topRow <= bottomRow) {
            for (let i = rightCol; i >= leftCol; i--) {
                process.stdout.write(matrix[bottomRow][i] + " ");
            }
            bottomRow--;
        }

        if (leftCol <= rightCol) {
            for (let i = bottomRow; i >= topRow; i--) {
                process.stdout.write(matrix[i][leftCol] + " ");
            }
            leftCol++;
        }
    }
}

// test the function
const matrix = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20]];
spiralMatrix(matrix);
```