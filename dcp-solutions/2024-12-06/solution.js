```javascript
function validateRules(rules) {
    let xDirs = { 'N': [0, -1], 'E': [1, 0], 'S': [0, 1], 'W': [-1, 0] };
    let yDirs = { 'N': [1, 0], 'E': [0, 1], 'S': [-1, 0], 'W': [0, -1] };

    for (let rule of rules) {
        let parts = rule.split(' ');
        if (!parts.length || parts[2] === undefined) continue;
        let xDirA = xDirs[parts[0]];
        let yDirA = yDirs[parts[0]];
        let xDirB = xDirs[parts[2]];
        let yDirB = yDirs[parts[2]];

        if ((xDirA[1] * xDirB[1]) + (yDirA[1] * yDirB[1]) !== 0) return false;

        let xDiffAB = parts[3];
        if (xDiffAB === undefined) continue;
        let xDirAB = xDirs[xDiffAB];

        if ((xDirAB[1] * xDirB[1]) + (yDirAB[1] * yDirB[1]) !== 0) return false;

        let yDiffAB = parts[4];
        if (yDiffAB === undefined) continue;
        let yDirAB = yDirs[yDiffAB];

        if ((xDirA[1] * xDirAB[1]) + (yDirA[1] * yDirAB[1]) !== 0) return false;

        if (((xDirB[1] - xDirAB[1]) * (xDirB[1] - xDirAB[1])) !== ((yDirB[1] - yDirAB[1]) * (yDirB[1] - yDirAB[1]))) return false;
    }

    return true;
}
```