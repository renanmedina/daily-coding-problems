```ruby
def canBeIncreasing(nums)
  prev = Float::INFINITY
  count = 0
  
  nums.each do |num|
    return false if num <= prev
    prev = num if num > prev
    count += 1 unless prev <= num
  end
  
  count < 2
end
```