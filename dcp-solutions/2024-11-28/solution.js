```javascript
function canNonDecrease(arr) {
    let increaseNeeded = 0;
    let decreaseNeeded = 0;

    for (let i = 1; i < arr.length; i++) {
        if (arr[i] > arr[i - 1]) {
            decreaseNeeded++;
        } else if (decreaseNeeded > 0) {
            decreaseNeeded--;
        } else {
            increaseNeeded++;
        }
    }

    return increaseNeeded <= 1 && decreaseNeeded <= 1;
}
```