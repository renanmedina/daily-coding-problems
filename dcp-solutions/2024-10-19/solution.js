```javascript
function singleNumber(nums) {
    let ones = 0, twos = 0;
    for (let num of nums) {
        twos |= ones & num;
        ones ^= num;
        threes = ones & twos;
        ones &= ~threes;
        twos &= ~threes;
    }
    return ones ^ twos;
}
```