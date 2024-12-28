```ruby
def max_subarray_sum(nums)
  # Initialize variables to track maximum sum and current sum
  max_sum = current_sum = nums.first
  
  # Iterate over array starting from second element
  (1...nums.size).each do |i|
    # Update current sum by adding the current number
    current_sum = [current_sum + nums[i], nums[i]].max
    
    # Update maximum sum if current sum is greater
    max_sum = [max_sum, current_sum].max
  end
  
  max_sum
end
```