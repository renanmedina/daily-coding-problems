```javascript
function numIslands(matrix) {
    if (!matrix || !matrix[0]) {
        return 0;
    }

    const rows = matrix.length;
    const cols = matrix[0].length;

    function dfs(r, c) {
        if (r < 0 || r >= rows || c < 0 || c >= cols || matrix[r][c] !== '1') {
            return;
        }

        matrix[r][c] = '0';

        dfs(r - 1, c);
        dfs(r + 1, c);
        dfs(r, c - 1);
        dfs(r, c + 1);
    }

    let islands = 0;

    for (let r = 0; r < rows; r++) {
        for (let c = 0; c < cols; c++) {
            if (matrix[r][c] === '1') {
                dfs(r, c);
                islands++;
            }
        }
    }

    return islands;
}
```