```javascript
function uniformRandom(l, n) {
    let total = new Set([...l]);
    let r = Math.floor(Math.random() * n);
    while(total.has(r)) {
        r = Math.floor(Math.random() * n);
    }
    return r;
}
```