```elixir
defmodule BinaryTree do
  @moduledoc "Generate an arbitrarily large binary tree"

  def generate() do
    # Create a list of nodes where each node is a tuple containing the value and its left and right children
    # The left child at index i is None, and the right child is created recursively on the next element in the list
    Enum.map(1..0, fn(i) -> {i, generate(), generate()} end)
  end
end
```