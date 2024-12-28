```elixir
def max_subarray(nums, k) do
  # initialize variables
  prefix_sum = Enum.reduce(0..k-1, 0, fn(i, acc) -> Enum.sum(Enum.at(nums, i..i+k-1)) + acc end)
  # Kadane's algorithm with prefix sum
  Enum.each_over_index(k..Enum.count(nums)-1, fn(i, j) ->
    # subtract the first element of previous window
    new_sum = Enum.sum(Enum.at(nums, j+1..j+k))
    new_prefix_sum = new_sum - prefix_sum
    if new_prefix_sum > prefix_sum do
      prefix_sum = new_prefix_sum
    end
  end)
  # print result
  for i <- k..Enum.count(nums), into: []
  end
end
```