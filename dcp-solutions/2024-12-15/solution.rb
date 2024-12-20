```ruby
def permute(nums)
  return [nums] if nums.length == 1

  result = []
  (0...nums.length).each do |i|
    current = nums[i]
    remaining = nums[0...i] + nums[i+1..-1]

    permutations = permute(remaining)

    for p in permutations
      result.push([current] + p)
    end
  end

  result
end
```