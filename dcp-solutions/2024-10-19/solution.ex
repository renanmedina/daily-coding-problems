```elixir
defmodule Solution do
  @moduledoc """
  Find a single integer in an array of integers where every integer occurs three times except for one integer.
  
  Time complexity: O(N)
  Space complexity: O(1)
  """

  def solve(nums) when is_list(nums) do
    sum = Enum.reduce(nums, 0, &(&1 + &2))
    List.zip(nums, nums | [Enum.at(nums, 0)])
      |> Stream.filter(fn {_x, _y} -> (enum_at(nums, 1) * 3 - enum_at(nums, 0)) == (_y - _x) end)
      |> Enum.reduce(Enum.at(nums, 0), fn x, y ->
        {Map.get(Enum.count_map(nums, &(&1 == x)), x), rem(nums, Map.delete(nums, x))}
      end)
      |> List.find(fn {_count, val} -> rem(val, elem(Map.keys(Enum.count_map(nums, &(&1 == val))), 0)) in [true, false] end)
    |> Enum.at(0)
  end

  def solve(_), do: :error
end
```