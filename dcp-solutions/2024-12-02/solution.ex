```elixir
defmodule TreeNode {
  @enforce_keys [:val, :left, :right]
  defstruct val: nil, left: nil, right: nil
}

defmodule BinaryTreeInverter {
  @spec invert_tree(TreeNode.t()) :: TreeNode.t()
  defstruct(_)

  def invert_tree(nil) do
    nil
  end

  def invert_tree(tree) when is_map() do
    %TreeNode{val: tree["val"], left: invert_tree(map_get(tree, :left)), right: invert_tree(map_get(tree, :right))} |> Map.new()
  end

  def invert_tree(tree) when is_list() do
    %TreeNode{
      val: tree[0]["val"],
      left: invert_tree(Enum.map(&1, &2["left"])),
      right: invert_tree(Enum.map(&1, &2["right"]))
    } |> Map.new()
  end
}
```