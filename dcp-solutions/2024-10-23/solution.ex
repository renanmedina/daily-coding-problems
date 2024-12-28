```elixir
defmodule Solution do
  def count_inversions(array) when is_list(array) do
    array
    |> Enum.map(&{-&1, &1})
    |> merge_sorted_list([])
  end

  defp merge_sorted_list([], _) do
    0
  end

  defp merge_sorted_list([current_row | current_array], acc_rows) do
    merged = Enum.reduce(current_row, [], fn element, acc ->
      new_acc =
        Enum.reduce(acc, [], fn e1, _ ->
          {new_element, new_count} = e1
          if element > new_element do
            [new_element, new_count + 1]
          else
            [element, new_count]
          end
        end)
      List.append(acc_rows, new_acc)
    end)

    merged
    |> Enum.reduce(acc_rows, &(&1 + &2))
  end

end
```