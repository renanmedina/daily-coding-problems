```elixir
defmodule Solution do
  @moduledoc """
    Solves the intersecting node problem from Google.

    Given two singly linked lists that intersect at some point, find the intersecting node.
    The lists are non-cyclical. This function returns the node with value equal to any node in the other list.
  """

  def intersect(list1, list2) do
    # Create a set of nodes from list2
    set = Enum.reduce(list2, Set.new(), fn(head, acc) ->
      Set.put(acc, head)
    end)

    # Find the common nodes between list1 and the set
    List.foldl(Enum.at(list1, 0), nil, fn(node, acc) ->
      if Set.member?(set, node) do
        node
      else
        acc
      end
    end)
  end
end
```