```elixir
defmodule LinkedList {
  def remove_kth_from_end(head, k) do
    a = b = head

    for _ <- 1..k do
      if nil == b do
        head = head.next
      else
        b = b.next
      end
    end

    case b do
      nil -> head
      head2 -> {a, a.next} |> List.replace_at(0, head2)
    end
  end
}
```