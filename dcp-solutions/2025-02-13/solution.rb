```ruby
def min_squares(n)
  dp = Array.new(n + 1, n + 1)
  dp[0] = 0
  (2..n).each do |i|
    (i * i..n).each do |j|
      dp[j] = [dp[j], dp[j - i * i] + 1].min
    end
  end
  dp[n]
end
```