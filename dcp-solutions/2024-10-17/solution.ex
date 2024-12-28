```elixir
defmodule QueenArrangements do
  @doc """
  Calculate the number of possible arrangements of an NxN board where N queens can be placed.
  
  ## Parameters
  - n: integer, size of the board
  
  ## Returns
  - integer, the number of possible arrangements
  """
  def count_arrangements(n), do: 
    arrangements = Enum.to_list(Enum.product([0..n-1], repeat: n))
    arrangements
    |> Stream.filter(fn row -> 
      row
      |> Enum.map(&(&1 + 1))
      |> Enum.uniq()
      |> length() == n
    end)
    |> Enum.count()
  end
end
```