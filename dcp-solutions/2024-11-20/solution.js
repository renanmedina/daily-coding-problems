```javascript
function rand5() {
    let res = 0;
    for (let i = 0; i < 5; i++) {
        res *= 7;
        res += rand7();
    }
    return res % 5 + 1;
}
```