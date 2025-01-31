```javascript
function partition(lst, x) {
    let less = [];
    let equal = [];
    let greater = [];

    lst.forEach(num => {
        if (num < x) {
            less.push(num);
        } else if (num === x) {
            equal.push(num);
        } else {
            greater.push(num);
        }
    });

    return [less, equal, greater];
}
```