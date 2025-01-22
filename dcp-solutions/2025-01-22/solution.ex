```elixir
defmodule SparseArray do
  defstruct rows \\ [] do
    Enum.reduce(0..size()-1, rows, fn i, acc ->
      row = Enum.at(acc, if(i >= size(), do: 0, else: i)
      cond do
        row == nil ->
          [nil | row]
        val = Enum.at(arr(), i) != 0 ->
          [val | row]
        true ->
          row
      end
    end)
  end

  @doc "Returns the size of the array"
  def size() do
    if(Enum.any?(rows()), do: size(), else: 0
  end

  @doc "Updates index at i with val. If i is out of range, updates to next highest power of two for sparse representation."
  def set(i, val) when is_integer(i), do: update_at(rows(), fn row -> Enum.at(row, i) = val end)
  def set(i, val), do: update_rows(Enum.max(rows()), 0, rows(), fn row, i -> Enum.at(row, i) == nil && val != nil end)

  @doc "Gets the value at index i. If i is out of range, returns nil for sparse representation."
  def get(i), do: Enum.at(rows(), if(Enum.any?(rows()), do: i, else: Enum.max(rows()) - 1)
end
```