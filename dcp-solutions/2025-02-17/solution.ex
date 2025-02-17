```elixir
defmodule LongestPathInTree do
  @spec longest_path(map) :: non_neg_integer
  def longest_path(tree) do
    longest_paths = Enum.map(tree, &LongestPathInTree.compute_longest_path/1)
    Enum.max(longest_paths, &(&1))
  end

  defp compute_longest_path({node, children}) when is_map do
    {Node.get_shortest_path(children), Map.get(children, :distance, 0)}
  end

  defp compute_longest_path({node, children}) when is_list do
    node_distance = Enum.sum(Enum.map(children, fn child -> Map.get(child, :distance) end))
    {Enum.join(node, ~w/|~s/), node_distance}
  end
end

defmodule Node do
  def get_shortest_path(subtree) do
    case subtree do
      nil -> []
      %{} => [root() | Enum.map_keys(Enum.map_values(subtree, &Node.get_shortest_path/1)) | ~w/|~s/|]
      _list -> Enum.reverse(Enum.map_sublist(subtree, fn child -> Node.get_shortest_path(child) end))
    end
  end

  defp root([]), do: []
  defp root({node, children}), do: [node() | Enum.map_keys(Enum.map_values(children, &Node.get_shortest_path/1)) | ~w/|~s/|]
end
```