```javascript
function breakString(s, k) {
    let words = s.split(' ');
    let result = [];
    let currentLine = '';
    
    for (let word of words) {
        if (currentLine.length + word.length > k) {
            if (!currentLine) continue;
            result.push(currentLine);
            currentLine = word;
        } else {
            if (currentLine) currentLine += ' ';
            currentLine += word;
        }
    }

    if (currentLine) result.push(currentLine);

    return result.length === 0 ? null : result;
}
```