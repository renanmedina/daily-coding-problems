```javascript
function checkBalance(s) {
    const bracketMap = {
        ')': '(',
        ']': '[',
        '}': '{',
        '=': '='
    };
    let stack = [];

    for (let char of s) {
        if (['(', '[', '{', '='].includes(char)) {
            stack.push(char);
        } else if (Object.values(bracketMap).includes(char)) {
            if (!stack.length || bracketMap[char] !== stack.pop()) {
                return false;
            }
        }
    }

    return !stack.length;
}
```