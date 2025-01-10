```ruby
def max_coins(matrix)
  rows, cols = matrix.size, matrix[0].size
  dp = Array.new(rows) { Array.new(cols, 0) }

  (0...rows).each do |i|
    (0...cols).each do |j|
      if i == 0 && j == 0
        dp[i][j] = matrix[i][j]
      elsif i == 0
        dp[i][j] = dp[i][j - 1] + matrix[i][j]
      elsif j == 0
        dp[i][j] = dp[i - 1][j] + matrix[i][j]
      else
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max + matrix[i][j]
      end
    end
  end

  dp[rows - 1][cols - 1]
end
```