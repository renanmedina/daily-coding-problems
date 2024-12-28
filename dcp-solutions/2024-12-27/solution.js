```javascript
function rotateString(A, B) {
    return A.length === B.length && A.split('').sort().join('') === B.split('').sort().join('');
}
```