```javascript
function reverseWords(s, delimiters) {
    let delimiterRegex = new RegExp(delimiters.join('|'), 'g');
    s = s.split(delimiterRegex).reverse().join(delimiterRegex);
    return s;
}
```