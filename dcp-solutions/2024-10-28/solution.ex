```elixir
def max_subarray_sum(nums) do
  # Initialize current sum and maximum sum to first element of the array
  current_sum = Enum.sum(enumerable: nums, start: 0)
  max_sum = Enum.sum(enumerable: [num], start: 0)

  # Iterate over the rest of the array
  for num in Enum.drop(nums, 1) do
    # Update current sum to be the current number plus or minus the old current sum
    new_current_sum = max(num, current_sum + num)
    
    # Update maximum sum if current sum is greater
    [max_sum, current_sum] = [new_current_sum, new_current_sum] do
      if new_current_sum > current_sum end
      else
        num
      end
  end

  # Return maximum sum
  max_sum
end
```