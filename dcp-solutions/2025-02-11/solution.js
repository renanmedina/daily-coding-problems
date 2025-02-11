```javascript
class Heap {
    constructor() {
        this.heap = [];
    }

    push(item) {
        this.heap.push(item);
        this._heapifyUp(this.heap.length - 1);
    }

    pop() {
        if (this.heap.length === 0) throw new Error('Heap is empty');
        const max = this.heap[0];
        this.heap[0] = this.heap[this.heap.length - 1];
        this.heap.pop();
        this._heapifyDown(0);
        return max;
    }

    _heapifyUp(index) {
        while (index > 0) {
            const parentIndex = Math.floor((index - 1) / 2);
            if (this.heap[parentIndex] <= this.heap[index]) break;
            [this.heap[parentIndex], this.heap[index]] = [this.heap[index], this.heap[parentIndex]];
            index = parentIndex;
        }
    }

    _heapifyDown(index) {
        const leftChildIndex = 2 * index + 1;
        const rightChildIndex = 2 * index + 2;
        let maxIndex = index;

        if (leftChildIndex < this.heap.length && this.heap[leftChildIndex] > this.heap[maxIndex])
            maxIndex = leftChildIndex;

        if (rightChildIndex < this.heap.length && this.heap[rightChildIndex] > this.heap[maxIndex])
            maxIndex = rightChildIndex;

        if (maxIndex !== index) {
            [this.heap[index], this.heap[maxIndex]] = [this.heap[maxIndex], this.heap[index]];
            this._heapifyDown(maxIndex);
        }
    }
}

class Stack {
    constructor() {
        this.heap = new Heap();
    }

    push(item) {
        this.heap.push(item);
    }

    pop() {
        return this.heap.pop();
    }
}
```