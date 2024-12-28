```python
def make_palindrome(s):
    n = len(s)
    dp = [[False] * n for _ in range(n)]
    dp_n = [float('inf')] * (n + 1)
    for i in range(n):
        dp_n[0] = 0
        dp[i][i] = True
        if s[i:i+1] == s[i]:
            dp_n[1] = 1

    for l in range(2, n + 1):
        for start in range(n - l + 1):
            end = start + l - 1
            if s[start] == s[end] and dp[start + 1][end - 1]:
                dp[start][end] = True
                dp_n[l] = min(dp_n[l], dp_n[start] + (l % 2))

    for i in range(n):
        for j in range(i, n):
            if dp[i][j] and ((s[i:j+1].lower()) not in [x.lower() for x in s] and 
                            len(x.lower()) == dp_n[j - i + 1]):
                return s[:i] + s[i:j+1].lower() + s[j+1:]
    return None
```