```ruby
def max_subarray_k(nums, k)
  # Initialize the window's maximum value
  window_max = nums[0]
  
  # Slide the window through the array
  (k..-1).each do |i|
    # Update the maximum of the current subarray
    window_max = [window_max, *nums[i-k+1..i]].max
    
    # Print the result
    puts "#{window_max} "
    
    # Slide the window forward by removing the leftmost element and adding the next one to the right
    nums.delete_at i-k+1
  end
end
```