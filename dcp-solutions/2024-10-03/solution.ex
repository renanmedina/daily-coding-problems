```elixir
defmodule LockingBinaryTree do
  @enforce_keys [:value, :left, :right]

  defstruct value: nil, left: nil, right: nil, parent: nil

  def new(value) when is_integer(value), do: %LockingBinaryTree{value: value, left: nil, right: nil, parent: nil}
  
  @type t :: %__MODULE__{left: any(), right: any()}
  defstruct left: nil, right: nil
}

defmodule LockingBinaryTree.LockingNode do
  use LockingBinaryTree

  def is_locked(%LockingBinaryTree{}), do: false

  def lock(%LockingBinaryTree{}) when not is_locked(%LockingBinaryTree{}, []) do
    true
  else
    false
  end

  def unlock(%LockingBinaryTree{}) when not is_locked(%LockingBinaryTree{}, [node | _] = ancestors) do
    true
  else
    false
  end

  defp is_locked(node, ancestors), do: node[:value] in ancestors
end
```