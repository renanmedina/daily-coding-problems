### Ruby Solution
```markdown
def largest_sum_of_non_adjacent(nums)
  if nums.empty?
    return 0
  elsif nums.size <= 2
    return nums.max
  end

  # Initialize dynamic programming array with zeros
  dp = Array.new(nums.size, 0)

  # Base case: pick the maximum number in the first two numbers
  dp[0] = nums[0]
  dp[1] = [nums[0], nums[1]].max

  # Fill up the rest of the dynamic programming array
  for i in 2..-1 do
    dp[i] = [dp[i-1], dp[i-2] + nums[i]].max
  end

  # Return the maximum sum found
  dp[-1]
end
```