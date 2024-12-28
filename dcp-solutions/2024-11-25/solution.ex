```elixir
defmodule OrderMatrix {
  @spec min_columns_to_remove(list(string)) -> integer
  def min_columns_to_remove(chars) when is_list(chars) do
    chars
    |> Enum.with_index()
    |> Enum.map(&{String.graphemes(&1, char_index: &2), char_index})
    |> Enum.group_by(&1)
    |> Enum.count(& &1|> 0)
    |> Enum.min()
  end

  def min_columns_to_remove(_), do: float("inf")
}
```