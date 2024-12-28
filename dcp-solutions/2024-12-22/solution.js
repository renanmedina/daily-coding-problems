```javascript
function shortestSubstring(s, chars) {
    if (!s || !chars.length) {
        return "";
    }

    let charMap = {};
    for (let char of chars) {
        charMap[char] = 0;
    }

    let left = 0;
    let minLen = Infinity;
    let minStr = "";

    let formed = 0;
    for (let right = 0; right < s.length; right++) {
        let char = s[right];
        if (char in charMap) {
            charMap[char]++;
            if (charMap[char] === 1) {
                formed++;
            }
        }

        while (formed === chars.length && left <= right) {
            if (right - left + 1 < minLen) {
                minLen = right - left + 1;
                minStr = s.slice(left, right + 1);
            }

            let char = s[left];
            charMap[char]--;
            if (char in charMap && charMap[char] === 0) {
                formed--;
            }
            left++;
        }
    }

    return minStr;
}
```