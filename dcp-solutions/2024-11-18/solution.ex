```elixir
def largest_product_of_three(nums) do
  nums_sorted = Enum.sort(nums)
  [^, -1, -2] = nums_sorted

  if nums_sorted[0] >= 0 do
    nums_sorted[0] * nums_sorted[1] * nums_sorted[-1]
  else
    nums_sorted[:1] ++ [nums_sorted[-1]] ++ [nums_sorted[-2]]
    |> Enum.sort()
    |> Enum.take(3)
    |> List.product()
    |> IO.inspect()
    end
end
```