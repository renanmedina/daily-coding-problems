```javascript
function numKnight Tours(N) {
    let moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]];
    let visited = Array.from({length: N*N}, () => false);
    let result = new Set();

    function dfs(i, j, step) {
        if (step === N*N) {
            result.add(JSON.stringify([i, j]));
            return;
        }

        for (let [dx, dy] of moves) {
            let ni = i + dx;
            let nj = j + dy;

            if (ni >= 0 && ni < N && nj >= 0 && nj < N && !visited[ni*N+nj]) {
                visited[ni*N+nj] = true;
                dfs(ni, nj, step+1);
                visited[ni*N+nj] = false;
            }
        }
    }

    for (let i = 0; i < N; i++) {
        for (let j = 0; j < N; j++) {
            dfs(i, j, 1);
        }
    }

    return result.size;
}
```