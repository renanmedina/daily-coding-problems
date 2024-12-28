```elixir
defmodule PowerSet do
  @doc """
  Generates the power set of a given set.

  ## Examples

  iex> PowerSet.power_set([1, 2, 3])
  [
    [],
    [1],
    [2],
    [3],
    [1, 2],
    [1, 3],
    [2, 3],
    [1, 2, 3]
  ]
  """
  def power_set([]), do: [[] | Enum.flatmap([|<<head::bitstring(1)..>>|, tail::list()|], Enum.flatmap(power_set(tail), &(&1 ++ [ head])))]
  def power_set([head | tail]), do: Enum.flatmap(power_set(tail), fn subset -> [head | subset] end) ++ power_set(tail)
end
```