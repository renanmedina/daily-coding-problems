```elixir
defp is_non_decreasing(arr) when is_binary(arr) do
  # Convert binary string to list of integers
  arr = String.split(arr, ",")

  # Check if array can become non-decreasing by modifying at most 1 element
  cond do
    Enum.count(Enum.slice(arr, 0..-2), &(&1 > &1 + 1)) == 0 ->
      true

    Enum.count(Enum.slice(arr, 0..-2), &(&1 < &1 - 1)) == 0 ->
      true

    true ->
      false
  end
end

defp is_non_decreasing(arr) when is_list(arr) do
  # Check if array can become non-decreasing by modifying at most 1 element
  cond do
    Enum.count(Enum.slice(arr, 0..-2), &(&1 > &1 + 1)) == 0 ->
      true

    Enum.count(Enum.slice(arr, 0..-2), &(&1 < &1 - 1)) == 0 ->
      true

    true ->
      false
  end
end
```