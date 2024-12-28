```javascript
function wordBreak(s, wordDict) {
    const n = s.length;
    const dp = new Array(n + 1).fill(false);
    dp[0] = true;

    for (let i = 1; i <= n; i++) {
        for (let j = 0; j < i; j++) {
            if (dp[j] && wordDict.includes(s.substring(j, i))) {
                dp[i] = true;
                break;
            }
        }
    }

    const res = [];
    function backtrack(i) {
        if (i >= n) return;
        for (let j = 0; j < i; j++) {
            if (dp[j] && wordDict.includes(s.substring(j, i + 1))) {
                res.push(s.substring(j, i + 1));
                backtrack(i + 1);
                break;
            }
        }
    }

    if (res.length === 0) return [];
    return res.reverse();
}
```