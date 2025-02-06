```javascript
class NumArray {
    constructor(L) {
        this.L = L;
        this.prefix_sum = new Array(L.length + 1).fill(0);
        
        // compute prefix sum array
        for (let i = 1; i <= L.length; i++) {
            this.prefix_sum[i] = this.prefix_sum[i-1] + L[i - 1];
        }
    }

    sum(i, j) {
        // return sum from index i to j (including i, excluding j)
        let s1 = this.prefix_sum[j] - this.prefix_sum[i]; 
        // return difference of prefix_sum at index j and sum of prefix_sum elements up to index i-1
        return s1;
    }
}
```