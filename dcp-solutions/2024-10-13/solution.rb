```ruby
def make_palindrome(s)
  s = s.chars.map(&:downcase).sort.join
  n = s.size
  min_length = n % 2 == 0 ? n : n + 1
  dp = Array.new(n + 1) { [nil, Float::INFINITY] }
  dp[0] = [s[0], 0]
  dp[n] = [s[n], 0]

  (1..n).each do |i|
    j = n - i
    for k in 0...j
      c1, cost1 = dp[k]
      c2, cost2 = dp[j, k]
      if cost1 + 1 == cost2 && s[i-1] != c2[-1]
        next
      end
      break unless c1 && c2
      if (c1 - c2).size <= 1 || (c1 - c2)[i-1, i] == [s[i], s[n-i]]
        cost = [cost1 + 1, cost2].min
        dp[i] = [c1 + s[i-1], cost]
      end
    end
    if s.size % 2 != 0
      next if (dp[i][1] == Float::INFINITY || dp[j][1] == Float::INFINITY)
      unless dp[i][1] < dp[j][1]
        i -= 1
      end
    end
  end

  res = s[0..dp.index { |i| dp[i][1] != Float::INFINITY }.last - 1]
  if (s.size % 2 == 0 && dp.index { |i| dp[i][1] != Float::INFINITY }[-1] + 1 == dp.index { |i| dp[i][1] != Float::INFINITY })
    res += s[dp.index { |i| dp[i][1] != Float::INFINITY }.last]
  else
    res += s[dp.index { |i| dp[i][1] != Float::INFINITY }[-1]]
  end

  if dp.index { |i| dp[i][1] != Float::INFINITY }
    res = res + (s[dp.index { |i| dp[i][1] != Float::INFINITY }[-1]] + res)[-(dp.index { |i| dp[i][1] != Float::INFINITY }).last..]
  end
  res.reverse!
  res += s[(dp.index { |i| dp[i][1] != Float::INFINITY }).last]
  res
end
```