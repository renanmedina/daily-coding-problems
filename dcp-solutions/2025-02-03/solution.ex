```elixir
defmodule BinaryTreePruner {
  def prune(root) do
    # Base case: empty tree or node with value 1
    if root == nil || root.val == 1, do: root
    
    # Recursively check left and right subtrees
    new_left = prune(root.left)
    new_right = prune(root.right)
    
    # If both subtrees contain only 0s, return nil
    if (new_left == nil && new_right == nil), do: nil
    
    # Otherwise, update the current node's value and connect it to the pruned subtrees
    %{root => %{
      val: root.val,
      left: new_left,
      right: new_right
    }}
  end

defmodule BinaryTreePruner {
  def traverse(root) do
    case root do
      nil -> []
      %{val: val, left: left, right: right} ->
        [val | traverse(left)] ++ traverse(right)
    end
  end
}

# Example usage:
root = %{
  val: 0,
  left: %{
    val: 1,
    left: %{
      val: 0,
      left: %{},
      right: %{}
    },
    right: %{
      val: 1,
      left: %{},
      right: %{}
    }
  },
  right: %{
    val: 0,
    left: %{
      val: 0,
      left: %{},
      right: %{}
    },
    right: %{
      val: 0,
      left: %{},
      right: %{}
    }
  }
}

pruned = BinaryTreePruner.prune(root)

IO.inspect(BinaryTreePruner.traverse(pruned))
```