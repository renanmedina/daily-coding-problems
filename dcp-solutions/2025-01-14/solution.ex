```elixir
defmodule ListRotator do
  @doc """
  Rotate a list by k elements.
  
  ## Example
    
      iex> rotate([1, 2, 3, 4, 5, 6], 2)
      [3, 4, 5, 6, 1, 2]
  """
  def rotate(lst, k) do
    k = k % length(lst)
    Enum.reverse(Enum.drop(lst, k))
  end
end
```