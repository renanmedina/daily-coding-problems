```elixir
defmodule LinkedListPalindrome do
  @doc """
  Checks if a doubly linked list is a palindrome.
  """
  def is_palindrome(head) when is_none?(head), do: true
  def is_palindrome(nil), do: false

  def is_palindrome({prev, curr, next} = node) do
    head = prev
    tail = next
    is_palindrome(head, tail)
  end

  @spec is_palindrome(head :: %{prev: any(), curr: any(), next: any()}) :: boolean
  defp is_palindrome(head, nil), do: true

  defp is_palindrome({prev, curr, next} = node1, {prev2, curr2, next2})
       when is_none?(next2) and is_none?(next1 = next(node)),
         (curr == curr2 and prev == prev2),
       do: false
  where
    next1: node -> node[next],
    next: nil

  defp is_palindrome({prev, curr, next} = node1, {prev2, curr2, next2})
       when is_none?(next1) and is_none?(next2),
         (curr != curr2 or prev != prev2),
       do: false
  where
    next1: node -> node[next],
    next: nil

  defp is_palindrome(node, tail)
       when is_nil(tail), do: true
  defp is_palindrome({prev, curr, next} = node, {next1, _, _})
       when is_none?(tail) and (curr != next1 or prev == next1),
         false,
       do: false
  where
    next1: next(node)
    tail: node[next]

  defp is_palindrome({prev, curr, next} = node, {prev2, _, _})
       when is_none?(tail) and (curr != next or prev == next),
         false,
       do: false
  where
    tail: node[prev]
    next: node[next]

  defp is_palindrome(nil, nil), true
end

defmodule LinkedListNode do
  @type t :: %__MODULE__{
             :data => any(),
               :prev => nil | %__MODULE__{},
                :next => nil | %__MODULE__{}
            }
end

defimpl LinkedListNode do
  defstruct [:data, :prev, :next]

  @doc false
  def new(data), do: %LinkedListNode{data: data}
end
```