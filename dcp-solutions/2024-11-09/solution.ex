```elixir
defmodule Solution do
  def possible?(mset) do
    mset = Enum.sort(mset)
    {n, _} = Enum.reduce(mset, {0, []}, &(&1 + &2))
    Enum.reduce(mset, %{}, fn x, acc ->
      # use x in subset a
      newacc = Map.put(acc, x, acc |> Map.get(x) |> add_to_a(x))
      # try to put x into subset b
      newacc ++ [x => subtract_from_b(0, x)]
    end)
    |> Enum.reduce([], fn {_, _} -> false end)
  end

  defp add_to_a(a, x), do: a + x
  defp subtract_from_b(sum, x), do: sum - x
end
```