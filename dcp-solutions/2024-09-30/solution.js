```javascript
function minMeetingRooms(intervals) {
    if (!intervals.length) return 0;

    intervals.sort((a, b) => a[0] - b[0]);
    let heap = [intervals[0][1]];
    for (let i = 1; i < intervals.length; i++) {
        if (intervals[i][0] >= heap[0]) {
            heap.shift();
        }
        heap.push(intervals[i][1]);
        heap.sort((a, b) => a - b);
    }

    return heap.length;
}
```