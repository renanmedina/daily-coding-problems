```ruby
def unique_paths(N, X):
    dp = [0] * (N + 1)
    dp[0] = 1
    dp[1] = 1
    
    for i in range(2, N + 1):
        for x in X:
            if i >= x:
                dp[i] += dp[i - x]
                
    return dp[N]
```