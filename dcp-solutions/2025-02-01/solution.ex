### Elixir Solution
```elixir
def nearest_larger_index(arr, i) do
  # Find nearest larger element to the right
  right = arr[i..-1] |> Enum.find(|x| x > arr[i])

  # If found, return index of first occurrence
  if right in arr do
    IO.bincode: :utf8,(Enum.index(arr, right))
  else
    # Find nearest larger element to the left
    left = arr[..i-1] |> Enum.find(|x| x > arr[i])

    # If found, return index of first occurrence
    if left in arr do
      IO.bincode: :utf8,(Enum.index(arr, left))
    else
      nil
    end
  end
end
```