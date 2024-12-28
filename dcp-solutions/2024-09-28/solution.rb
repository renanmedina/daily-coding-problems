```ruby
def minCost(n, k, costs)
  dp = Array.new(k) { Array.new(n, 0) }
  dp[0][0] = costs[0][0]
  
  (1..n-1).each do |i|
    (k-1).each do |j|
      max_val = [dp[j][i-1], dp[(j+1)%k][i-1]].max
      dp[j][i] = max_val + costs[i][j]
    end
  end
  
  dp.minmax.max
end
```