```ruby
def rotate(nums, k):
  k %= nums.size
  n = nums.size
  left = 0
  right = n - k

  while true
    # swap first element to last
    nums[left], nums[right] = nums[right], nums[left]
    right += 1
    if right == n 
      break 
    end 

    # move next elements of the sequence one step forward
    left += 1
    right += 1

    # if all elements are in order, then just swap last element with first
    return unless nums[left..-1].each_with_index.all? { |e, i| e == nums[i+n-k] }
  end
end
```