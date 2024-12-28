```elixir
def count_ways(n, m) do
  dp = Enum.map(1..m, &(&1))
  Enum.reduce(1..n, Enum.map(1..m, &(&1)), fn
    row, cols -> Enum.map(0..m-1, fn col ->
      row_value = Enum.at(dp, row-1)
      Enum.reduce(0..col-1, row_value, fn prev_col, acc -> acc + Enum.at(Enum.at(dp, prev_col), col) end)
    end
  end)
end
```