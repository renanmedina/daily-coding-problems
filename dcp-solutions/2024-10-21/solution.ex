```elixir
defmodule SubarraySum do
  def find_subarray(nums, target) when is_list(nums) do
    nums
    |> Enum.with_index()
    |> Enum.map(fn {n, i} -> [n, n * i] end)
    |> Enum.reduce nil, fn acc, [{subarray, index}] ->
      case Enumerable.sum(subarray) == target do
        true -> subarray
        false -> acc
      end
    end
  end

  def find_subarray(nums, target), do: find_subarray(Enum.map(fn elem -> [elem, elem] end, nums), target)
end
```