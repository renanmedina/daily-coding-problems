```javascript
function minSteps(points) {
    let grid = Array(2000).fill().map(() => Array(2000).fill(-1));
    let queue = [[0, 0, 0]];
    let visited = new Set(['0,0']);

    while (queue.length > 0) {
        let [x, y, steps] = queue.shift();
        for (let dx of [-1, 0, 1]) {
            for (let dy of [-1, 0, 1]) {
                if (dx === 0 && dy === 0) continue;
                let nx = x + dx;
                let ny = y + dy;
                if (nx >= 0 && nx < 2000 && ny >= 0 && ny < 2000 && grid[nx][ny] === -1) {
                    queue.push([nx, ny, steps + 1]);
                    visited.add(`${nx},${ny}`);
                    grid[nx][ny] = points[steps];
                }
            }
        }
    }

    return points.length;
}
```