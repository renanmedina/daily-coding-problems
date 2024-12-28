```ruby
def find_subarray(nums, k)
  left = 0
  sum = 0
  hash = {}

  nums.each_with_index do |num, right|
    sum += num

    while sum - k > 0 && hash.key?(sum - k)
      left += 1
      sum -= nums[left]
      hash.delete(sum)
    end

    if sum == k
      return nums[left..right]
    end

    hash[num] = right
  end

  []
end
```