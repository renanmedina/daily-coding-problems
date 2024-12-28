```ruby
def max_product(nums)
  nums.sort!

  # Product of three largest numbers
  product1 = nums.last * nums[-2] * nums[-3]

  # Product of two smallest numbers and one largest number
  product2 = nums.first * nums[1] * nums.last

  # Return the maximum of the two products
  [product1, product2].max
end
```