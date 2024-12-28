### Elixir Solution
```elixir
defmodule LinkedListMerge do
  defstruct head \\nil

  @doc """
  Merges k sorted singly linked lists into one sorted singly linked list.

  Args:
    lists (list): A list of sorted singly linked lists.
    head (ListNode) | nil: The head of the new merged linked list.

  Returns:
    ListNode: The head of the merged and sorted linked list.
  """
  def merge(lists, head \\nil)
  when is_list(lists) do
    lists = Enum.map(lists, &merge/1, &1)
    head = Enum.max(Enum.map(lists, &(&1.head), fn _ -> nil end))
    cond do
      head == nil -> Enum.at(lists, 0)
      true ->
        new_list = Enum.reduce(lists, %{head: head}, &( merge_at(&1, &2) ))
        merge(new_list, head)
    end
  end

  defp merge_at(nil, _), do: nil

  defp merge_at({head: ^head}, {tail: ^new_head}), do: %{head: new_head, tail: head}

  defp merge_at({head: ^head1, tail: ^head2}, {tail: ^new_head}) when is_integer(head1) and is_integer(head2), do: %{head: max(head1, head2), tail: nil}

end
```