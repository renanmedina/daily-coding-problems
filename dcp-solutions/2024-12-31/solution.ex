```elixir
defmodule TreeNode {
  @enforce_keys [:value, :parent]

  defstruct value: nil, parent: nil

  @type t() :: %__MODULE__{
    value: integer,
    parent: TreeNode.t()
  }

  def new(value) do
    %__MODULE__{value: value, parent: nil}
  end

  @spec find_lca(TreeNode.t(), TreeNode.t()) :: TreeNode.t() | nil
  def find_lca(root, node1), do: find_lca(node1, root, [])

  defp find_lca(nil, _node, _) do
    nil
  end

  defp find_lca(node, nil, _path) when is_nil(node), do: nil

  defp find_lca(node, parent, path) when node != parent do
    {parent_left, parent_right} = {node.parent, self()}
    if node.value < parent.value do
      find_lca(parent_left, node, [parent] | path)
    else
      find_lca(parent_right, node, [parent] | path)
    end
  end

  defp find_lca(node, _parent, _path) when is_nil(parent), do: nil
end
```