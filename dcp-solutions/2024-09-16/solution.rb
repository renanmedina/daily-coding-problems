```ruby
def num_decodings(s)
  if s[0] == '0'
    return 0
  end

  dp = Array.new(s.length + 1, 0)
  dp[0] = 1
  dp[1] = 1

  (2...s.length).each do |i|
    if s[i] != '0'
      dp[i + 1] += dp[i]
    end

    num = s[i - 1].to_i * 10 + s[i].to_i
    if num <= 26
      dp[i + 1] += dp[i - 1]
    end
  end

  dp[s.length]
end
```