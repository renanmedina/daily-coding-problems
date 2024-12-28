```ruby
def edit_distance(s1, s2)
  m, n = s1.length, s2.length
  dp = Array::new(m + 1) { Array::new(n + 1) }

  (0...m).each do |i|
    dp[i][0] = i
  end

  (0...n).each do |j|
    dp[0][j] = j
  end

  (1...m).each do |i|
    (1...n).each do |j|
      if s1[i - 1] == s2[j - 1]
        dp[i][j] = dp[i - 1][j - 1]
      else
        dp[i][j] = 1 + [dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]].min
      end
    end
  end

  dp[m][n]
end
```