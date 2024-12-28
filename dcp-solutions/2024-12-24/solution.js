```javascript
function debounce(f, n) {
    let timer = null;
    return function(...args) {
        if (timer !== null) {
            clearTimeout(timer);
        }
        timer = setTimeout(() => {
            f(...args);
            timer = null;
        }, n);
    };
}
```