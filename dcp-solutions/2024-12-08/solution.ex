```elixir
defmodule ValidBST do
  @spec valid_tree(map) :: boolean
  def valid_tree(tree) when is_map, do: valid_tree(map_to_list(tree))
  def valid_tree(tree), do: Enum.all?(tree, fn {_key, left} -> valid_tree(left) end)

  defp map_to_list({key, value}), do: [{key, value}]
  defp map_to_list(tree) when is_list, do: tree
end
```