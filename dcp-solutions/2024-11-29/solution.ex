```elixir
defmodule BinaryTreeDeepestNode do
  def deepest_node(root) when is_nil(root), do: nil
  def deepest_node({node, left, right}) do
    [leftmost_left, leftmost_right] = widest_subtree(left, right)
    if leftmost_left == left,
      do: node,
      else: widest_subtree(right, left).leftmost_left
  end

  defp widest_subtree(nil, _), do: {nil, nil}
  defp widest_subtree({node, _, _}, right) do
    [{node, leftmost_left}, rightmost_right]
  end
  defp widest_subtree(_, {right, node}) do
    [{right, rightmost_right}, node]
  end

  defp leftmost_left({left, _}, right),
    do: left == nil ? right : [left, nil]
  defp leftmost_left({_, left}, right), do: [nil, right]

  defp rightmost_right({left, right}, {node, _}),
    do: right == nil ? node : [right, nil]
  defp rightmost_right({left, right}, {_, node}), do: [left, node]
end
```