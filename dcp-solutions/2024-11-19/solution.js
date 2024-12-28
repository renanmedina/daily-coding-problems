```javascript
function nthPerfectNumber(n) {
    let count = 0;
    let num = 1;
    while (true) {
        if (isPerfect(num)) {
            count++;
            if (count === n) return num;
        }
        num++;
    }
}

function isPerfect(num) {
    let sum = 0;
    for (let digit of num.toString()) {
        sum += parseInt(digit);
    }
    return sum === 10;
}
```