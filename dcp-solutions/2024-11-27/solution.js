### Merge K Sorted Linked Lists
```javascript
class ListNode {
    constructor(val = 0, next = null) {
        this.val = val;
        this.next = next;
    }
}

class Solution {
    mergeKLists(heads) {
        const queue = new MinPriorityQueue({
            priority: (node) => node.val,
        });
        heads.forEach((head) => queue.enqueue(head));
        
        let dummyHead = new ListNode(0);
        let current = dummyHead;
        
        while (!queue.isEmpty()) {
            const node = queue.dequeue();
            current.next = node;
            current = current.next;
            
            if (node.next) {
                queue.enqueue(node.next);
            }
        }
        
        return dummyHead.next;
    }
}

// MinPriorityQueue implementation
class MinPriorityQueue {
    constructor(priority) {
        this.queue = [];
        this.priority = priority;
    }
    
    isEmpty() {
        return this.queue.length === 0;
    }
    
    enqueue(node) {
        this.queue.push(node);
        this._heapifyUp(this.queue.length - 1);
    }
    
    dequeue() {
        if (this.isEmpty()) {
            throw new Error('Queue is empty');
        }
        
        const min = this.queue[0];
        this.queue[0] = this.queue[this.queue.length - 1];
        this.queue.pop();
        this._heapifyDown(0);
        
        return min;
    }
    
    _heapifyUp(index) {
        let parentIndex = Math.floor((index - 1) / 2);
        while (parentIndex >= 0 && this.priority(this.queue[parentIndex]) > this.priority(this.queue[index])) {
            [this.queue[parentIndex], this.queue[index]] = [this.queue[index], this.queue[parentIndex]];
            index = parentIndex;
            parentIndex = Math.floor((index - 1) / 2);
        }
    }
    
    _heapifyDown(index) {
        let smallest = index;
        const leftChildIndex = 2 * index + 1;
        const rightChildIndex = 2 * index + 2;
        
        if (leftChildIndex < this.queue.length && this.priority(this.queue[leftChildIndex]) < this.priority(this.queue[smallest])) {
            smallest = leftChildIndex;
        }
        
        if (rightChildIndex < this.queue.length && this.priority(this.queue[rightChildIndex]) < this.priority(this.queue[smallest])) {
            smallest = rightChildIndex;
        }
        
        if (smallest !== index) {
            [this.queue[index], this.queue[smallest]] = [this.queue[smallest], this.queue[index]];
            this._heapifyDown(smallest);
        }
    }
}
```