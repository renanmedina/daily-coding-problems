```javascript
function longestPalindromicSubstring(s) {
    const n = s.length;
    let start = 0;
    let maxLen = 1;

    function expandAroundCenter(left, right) {
        while (left >= 0 && right < n && s[left] === s[right]) {
            left--;
            right++;
        }
        return s.slice(left + 1, right);
    }

    for (let i = 0; i < n; i++) {
        const len1 = expandAroundCenter(i, i); // odd length palindrome
        const len2 = expandAroundCenter(i, i + 1); // even length palindrome
        let maxLenOfLen1 = len1.length;
        let maxLenOfLen2 = len2.length;

        if (maxLenOfLen1 > maxLen) {
            start = i - Math.floor((maxLenOfLen1 - 1) / 2);
            maxLen = maxLenOfLen1;
        }
        if (maxLenOfLen2 > maxLen && maxLenOfLen2 % 2 === 0) {
            start = i - Math.floor((maxLenOfLen2 - 2) / 2);
            maxLen = maxLenOfLen2;
        }
    }

    return s.slice(start, start + maxLen);
}
```