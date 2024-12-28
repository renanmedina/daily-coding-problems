```elixir
defmodule RotateArray {
  @spec find_index(list, int) :: non_nil | nil
  def find_index(arr, target) when is_binary(target) do
    target = Integer.parse(target)
    index = find_index(arr, target, 0)
    case index do
      nil -> nil
      i ->
        Enum.find_index(arr, &(&1 > target))
        ++ i
    end
  end

  defp find_index([], _), do: nil

  defp find_index([head | tail], target) when head == target do
    0
  end

  defp find_index([head | tail], target) when head < target do
    1 + find_index(tail, target)
  end

  defp find_index([^head | tail], target) do
    1 + find_index(tail, target)
  end
}
```