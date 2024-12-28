```ruby
def trap(height)
  # Initialize variables to keep track of current and maximum height on both sides
  left, right = 0, height.size - 1
  max_left, max_right = 0, 0
  
  # Initialize the result variable
  water = 0
  
  while left <= right
    # If the current height on the left side is less than the current height on the right side
    if height[left] < height[right]
      # If we're at the boundary or the maximum height seen so far on the left is less than the current height
      unless left == 0 || max_left >= height[left]
        # Add the difference to the total amount of water that can be trapped
        water += (max_left - height[left])
      end
      # Update the maximum height seen so far on the left side
      max_left = [max_left, height[left]] if max_left > height[left]
      # Move the left pointer to the right
      left += 1
    else
      # If we're at the boundary or the maximum height seen so far on the right is less than the current height
      unless right == height.size - 1 || max_right >= height[right]
        # Add the difference to the total amount of water that can be trapped
        water += (max_right - height[right])
      end
      # Update the maximum height seen so far on the right side
      max_right = [max_right, height[right]] if max_right > height[right]
      # Move the right pointer to the left
      right -= 1
    end
  end
  
  # Return the total amount of water that can be trapped
  water
end
```