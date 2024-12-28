```ruby
def search(nums, target):
  if nums.empty?
    return nil
  end
  
  left, right = 0, nums.size - 1
  while left <= right do
    mid = (left + right) / 2
    
    # If the target is found at index mid
    if nums[mid] == target
      return mid
    # The target must be in the half of the array on the left side
    elif nums[left] <= nums[mid]
      # If the target is in the range [nums[left], nums[mid]]
      if nums[left] <= target && target < nums[mid]
        return mid
      end
      # Move to the left half
      right = mid - 1
    else
      # The target must be in the half of the array on the right side
      # If the target is in the range [nums[mid], nums[right]]
      if nums[mid] < target && target <= nums[right]
        return mid
      end
      # Move to the right half
      left = mid + 1
    end
  end
  
  # If the target is not found
  return nil
end
```