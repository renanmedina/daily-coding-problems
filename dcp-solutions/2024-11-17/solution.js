```javascript
function countAttackingBishops(bishops) {
    let m = Math.max(...bishops.map(([x, y]))[0], ...bishops.map(([x, y]))[1]) + 1;
    let diagonalCounts = Array(2 * m - 1).fill(0);
    
    for (let [x1, y1] of bishops) {
        let dx = Math.abs(x1 - m / 2), dy = Math.abs(y1 - m / 2);
        if (dx === dy) diagonalCounts[dx - m / 2]++;
    }
    
    return bishops.filter(([x1, y1]) => {
        let dx = Math.abs(x1 - m / 2), dy = Math.abs(y1 - m / 2);
        return diagonalCounts[dx - m / 2] >= 2;
    }).length * (bishops.length - 1) / 2;
}
```