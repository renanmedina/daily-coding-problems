```javascript
function fullJustify(words, k) {
    let result = [];
    let curLine = [];
    let curLen = 0;

    for (let word of words) {
        if (curLen + word.length > k) {
            result.push(getFilledString(curLine, k));
            curLine = [word];
            curLen = word.length;
        } else {
            curLine.push(word);
            curLen += word.length;
        }
    }

    result.push(getFilledString(curLine, k));

    return result;

    function getFilledString(words, k) {
        let totalLen = words.reduce((a, b) => a + b.length, 0);
        let numSpaces = k - totalLen;
        let spacesPerWord = Math.floor(numSpaces / (words.length - 1));
        let extraSpaces = numSpaces % (words.length - 1);

        let filledString = '';
        for (let i = 0; i < words.length; i++) {
            filledString += words[i];
            if (i < words.length - 1) {
                filledString += ' '.repeat(spacesPerWord + (i < extraSpaces ? 1 : 0));
            }
        }

        return filledString;
    }
}
```