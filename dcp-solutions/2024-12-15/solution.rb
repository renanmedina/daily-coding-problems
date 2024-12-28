```ruby
def permute(nums)
  if nums.size == 1
    [nums]
  else
    result = []
    (0...nums.size).each do |i|
      num = nums[i]
      rest = nums[i+1..-1].clone
      perms = permute(rest)
      perms.each do |perm|
        result << [num, *perm]
      end
    end
    result
  end
end
```