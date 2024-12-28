```javascript
function maxSubarrayLength(nums, k) {
    const n = nums.length;
    let windowSum = 0;
    let maxNums = new Array(n).fill(0);
    let left = 0;

    for (let right = 0; right < n; right++) {
        windowSum += nums[right];
        
        if (right >= k - 1) {
            maxNums[left] = Math.max(maxNums[left], windowSum);
            windowSum -= nums[left];
            left++;
        }
    }

    for (let i = k; i < n; i++) {
        process.stdout.write(maxNums[i - k] + " ");
    }
}

// test the function
maxSubarrayLength([10, 5, 2, 7, 8], 3);
```