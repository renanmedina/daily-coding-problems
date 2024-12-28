```javascript
function subarraySum(nums, k) {
    let sumMap = new Map();
    sumMap.set(0, -1);
    let currentSum = 0;
    
    for (let i = 0; i < nums.length; i++) {
        currentSum += nums[i];
        
        if (sumMap.has(currentSum - k)) {
            return [nums[sumMap.get(currentSum - k) + 1], currentSum, i].slice(1);
        }
        
        sumMap.set(currentSum, i);
    }
    
    return [];
}
```