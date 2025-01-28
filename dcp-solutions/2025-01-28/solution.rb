```ruby
def single_number(nums)
  one, two = 0, 0
  nums.each do |n|
    one ^= n
    two ^= one
  end
  [one, two]
end
```

This solution uses the XOR operation to find the numbers that appear only once. The XOR of a number with itself is zero, and the XOR of two different numbers is unique. By XORing all elements in the array, we are left with the XORs of the numbers that appear exactly twice and the numbers that appear exactly once, respectively.