### Elixir Solution
```elixir
def largest_sum_of_non_adjacent(nums) do
  0..length(nums) - 1
  |> Enum.reduce({nil, 0}, fn i, {prev_max, prev_prev} ->
    cond do
      is_nil(prev_prev) ->
        max(i, prev_max)
      else
        prev_max = max(i, prev_max)
        prev_prev = prev_max
      end
    end
  end)
  |> List.last()
end
```