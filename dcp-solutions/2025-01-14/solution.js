```javascript
function rotateList(nums, k) {
    let n = nums.length;
    k %= n; // equivalent to (k + n) % n
    for (let i = 0; i < k; i++) {
        const temp = nums[n - k + i];
        for (let j = n - k + i; j >= i; j--) {
            nums[j] = nums[j - 1];
        }
        nums[i] = temp;
    }
    return nums;
}
```