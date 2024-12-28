```javascript
function mergeIntervals(intervals) {
    intervals.sort((a, b) => a[0] - b[0]);

    const merged = [];
    let currentEnd = null;

    for (let start of intervals) {
        if (!currentEnd || start[0] > currentEnd) {
            if (currentEnd) {
                merged.push([currentEnd[0], currentEnd[1]]);
            }
            currentEnd = start;
        } else {
            currentEnd[1] = Math.max(currentEnd[1], start[1]);
        }
    }

    if (currentEnd) {
        merged.push([currentEnd[0], currentEnd[1]]);
    }

    return merged;
}
```