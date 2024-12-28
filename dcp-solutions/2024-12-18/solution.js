```javascript
function longestConsecutive(nums) {
    let numSet = new Set(nums);
    let maxLen = 0;

    for (let num of numSet) {
        if (!numSet.has(num - 1)) {
            let currentNum = num;
            let currentLen = 1;

            while (numSet.has(currentNum + 1)) {
                currentNum += 1;
                currentLen += 1;
            }

            maxLen = Math.max(maxLen, currentLen);
        }
    }

    return maxLen;
}
```