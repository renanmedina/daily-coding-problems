```elixir
defmodule Solution do
  @doc """
  Returns the size of the largest subtree that is a BST.
  """
  def largest_bst_size(node) when is_nil(node), do: 0

  def largest_bst_size({node: nil, size: size}) when is_nil(size), do: size || 0
  def largest_bst_size(%{node: node, size: size}) when is_nil(size), do: 1 + largest_bst_size.(node)
  def largest_bst_size %{node: nil, size: size} when is_nil(node), do: size

  @doc """
  Returns the root of the largest BST subtree.
  """
  def largest_bst_root(node) when is_nil(node), do: nil
  def largest_bst_root({node: :_, size: 0}), do: nil
  def largest_bst_root(%{node: node, size: size}) when is_nil(node), do: node || nil

  @doc """
  Recursively checks if a tree is BST and returns its size.
  """
  def is_bst({node: :_, left: _, right: _}, min \\nil, max \\nil) do
    case {node, left, right} do
      {:_, :_, nil} -> true
      {:_, :_, node2} when is_nil(node2) ->
        (min == nil or node < min) and (max == nil or node > max)
      {:_, :left, :right} ->
        is_bst.(left, min, node)
          and is_bst.(right, node, max)
      _ -> false
    end
  end

  def largest_bst_size(node) do
    case {node, nil, nil} do
      {:_, _, nil} -> 0
      {:_, size: size1, _, left: _, right: _, _} when is_nil(left) and is_nil(right) ->
        1 + largest_bst_size.(left) + largest_bst_size.(right)
      {node: :_, _, left: nil, right: nil} -> 0
      {node: :_, size: size1, _, left: left, _, _} when is_nil(left) ->
        1 + size1 + largest_bst_size.(left)
      {node: :_, size: size1, _, _, right: right, _} when is_nil(right) ->
        1 + size1 + largest_bst_size.(right)
      {node:, left: node2, right: node3, size: size} -> (
          left == nil or right == nil
          or (left != nil and right != nil and is_bst(node2, min(node), max(node)) and is_bst(node3, min(node), max(node)))
        ) && 1 + size + largest_bst_size.(node3) + largest_bst_size.(node2)
      _ -> Float.positivity
    end
  end

  def largest_bst_root(node) do
    case {node, nil, nil} do
      {:_, _, nil} -> nil
      {:_, size: size1, _, left: _, right: _, _} when is_nil(left) and is_nil(right) ->
        node || nil
      {node: :_, _, left: _, _, right: _, _} when is_nil(left) ->
        node || nil
      {node: :_, _, _, left: _, _, right: nil} -> node || nil
      {node:, _, _, _, _, right: right, _, _} when is_nil(right) ->
        node || right || nil
      {node:, left: node2, right: node3, size: size} -> (
          left == nil or right == nil
          or (left != nil and right != nil and is_bst(node2, min(node), max(node)) and is_bst(node3, min(node), max(node)))
        ) && node || largest_bst_root.(node2) || largest_bst_root.(right)
      _ -> nil
    end
  end
end
```