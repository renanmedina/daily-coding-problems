```javascript
function largestProduct(nums) {
    let sortedNums = [...nums].sort((a, b) => a - b);

    // Return the product of three largest numbers and the product of two smallest (most negative) numbers
    return Math.max(sortedNums[0] * sortedNums[1] * sortedNums[sortedNums.length - 1], 
                   sortedNums[0] * sortedNums[sortedNums.length - 1] * sortedNums[sortedNums.length - 2]);
}
```