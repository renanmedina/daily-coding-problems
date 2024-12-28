```ruby
def unique_paths(N, M)
  dp = Array.new(N) { Array.new(M, 0) }
  dp[0][0] = 1
  
  (0...N).each do |i|
    dp[i][0] = 1
  end
  
  (0...M).each do |j|
    dp[0][j] = 1
  end
  
  (1...N).each do |i|
    (1...M).each do |j|
      dp[i][j] = dp[i-1][j] + dp[i][j-1]
    end
  end
  
  dp[N-1][M-1]
end
```