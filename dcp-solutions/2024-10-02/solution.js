```javascript
/**
 * @param {boolean[][]} board 
 * @param {number} start 
 * @param {number} end 
 * @return {number|null}
 */
function shortestPathBinaryMatrix(board, start, end) {
    const m = board.length;
    const n = board[0].length;

    if (start[0] < 0 || start[0] >= m || start[1] < 0 || start[1] >= n ||
        end[0] < 0 || end[0] >= m || end[1] < 0 || end[1] >= n) {
        return null;
    }

    if (board[start[0]][start[1]] !== false || board[end[0]][end[1]] !== false) {
        return null;
    }

    const queue = [[start, 0]];
    const visited = new Set([`${start[0]},${start[1]}`]);
    const directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];

    while (queue.length > 0) {
        const [[x, y], step] = queue.shift();

        if (x === end[0] && y === end[1]) {
            return step;
        }

        for (const [dx, dy] of directions) {
            const nx = x + dx;
            const ny = y + dy;

            if (nx >= 0 && nx < m && ny >= 0 && ny < n &&
                board[nx][ny] !== false &&
                !visited.has(`${nx},${ny}`)) {
                queue.push([[nx, ny], step + 1]);
                visited.add(`${nx},${ny}`);
            }
        }
    }

    return null;
}
```