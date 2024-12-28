```javascript
class MedianFinder {
    constructor() {
        this.minHeap = [];
        this.maxHeap = [];
    }

    addNum(num) {
        const { minHeap, maxHeap } = this;
        if (minHeap.length === 0 || num <= minHeap[0]) {
            this.minHeap.push(num);
            minHeap.sort((a, b) => a - b);
            if (minHeap.length > maxHeap.length) {
                const temp = minHeap.shift();
                maxHeap.unshift(temp);
                maxHeap.sort((a, b) => a - b);
            }
        } else {
            this.maxHeap.push(num);
            maxHeap.sort((a, b) => a - b);
            if (this.maxHeap.length > minHeap.length + 1) {
                const temp = maxHeap.shift();
                minHeap.unshift(temp);
                minHeap.sort((a, b) => a - b);
            }
        }

        this.updateMedian();
    }

    findMedian() {
        const { minHeap, maxHeap } = this;
        if (minHeap.length === maxHeap.length) return (minHeap[0] + maxHeap[0]) / 2;
        return minHeap[0];
    }

    updateMedian() {
        if (this.minHeap.length > 0 && this.maxHeap.length > 0) {
            const median = Math.round((this.minHeap[0] + this.maxHeap[0]) / 2);
            console.log(median);
        } else if (this.minHeap.length > 0) {
            console.log(this.minHeap[0]);
        } else if (this.maxHeap.length > 0) {
            console.log(this.maxHeap[0]);
        }
    }
}
```