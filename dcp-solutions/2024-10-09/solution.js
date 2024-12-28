```javascript
function trapRainWater(heightMap) {
    let m = heightMap.length;
    let n = heightMap[0].length;

    let leftMax = new Array(n).fill(0);
    let rightMax = new Array(n).fill(0);

    for (let i = 1; i < n - 1; i++) {
        leftMax[i] = Math.max(leftMax[i-1], heightMap[0][i]);
        rightMax[i] = Math.max(rightMax[i+1], heightMap[m-1][i]);
    }

    let totalWater = 0;
    for (let i = 0; i < m; i++) {
        for (let j = 1; j < n - 1; j++) {
            let minHeight = Math.min(leftMax[j], rightMax[j]);
            if (heightMap[i][j] < minHeight) totalWater += minHeight - heightMap[i][j];
        }
    }

    return totalWater;
}
```