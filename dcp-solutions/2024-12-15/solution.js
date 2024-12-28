```javascript
function permute(digits) {
    if (digits.length === 1) return [digits];
    let res = [];
    for (let i = 0; i < digits.length; i++) {
        let currDigit = digits[i];
        let restDigits = [...digits.slice(0, i), ...digits.slice(i + 1)];
        for (let p of permute(restDigits)) {
            res.push([currDigit].concat(p));
        }
    }
    return res;
}
```