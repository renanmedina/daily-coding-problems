```javascript
function maxNonAdjacentSum(nums) {
    let zero = 0;
    let notZero = nums[0] > 0 ? nums[0] : 0;

    for (let i = 1; i < nums.length; i++) {
        let temp = zero;
        zero = Math.max(zero, notZero);
        notZero = Math.max(notZero, temp + nums[i]);
    }

    return Math.max(zero, notZero);
}
```