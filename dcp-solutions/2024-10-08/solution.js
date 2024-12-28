```javascript
class RunLengthEncoding {
  encode(str) {
    let result = '';
    let prevChar = str[0];
    let count = 1;

    for (let i = 1; i <= str.length; i++) {
      if (i < str.length && str[i] !== prevChar) {
        result += count.toString() + prevChar;
        prevChar = str[i];
        count = 1;
      } else {
        count++;
      }
    }

    return result;
  }

  decode(str) {
    let result = '';
    for (let i = 0; i < str.length; i += 2) {
      let count = parseInt(str.substring(i, i + 2));
      let char = str[i + 2];
      result += String.fromCharCode(char.charCodeAt(0) + count);
    }
    return result;
  }
}
```