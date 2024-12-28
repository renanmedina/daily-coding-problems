```ruby
def canPartition(nums)
  total_sum = nums.sum
  return false if total_sum % 2 != 0 || total_sum / 2 < nums.min

  (1..total_sum / 2).each do |target_sum|
    dp = Array.new(total_sum + 1, false)
    dp[0] = true
    nums.each do |num|
      (dp.length - num...dp.length).each do |i|
        next if dp[i] == false
        dp[i + num] = true if i + num <= dp.length && !dp[i + num]
      end
    end

    return true if dp[total_sum / 2]
  end

  false
end
```