```elixir
def count_attacking_bishops(m, bishops) do
  bishops_map = Map.new()
  for {row, col} <- Enum.map(bishops, fn {x, y} -> {rem(x, m), rem(y, m)} end),
      do: bishops_map[Map.put(bishops_map, {rem(x, m), rem(y, m)}, nil), row] = [row]

  attacking_pairs = Enum.flat_map(bishops_map,
    fn {diagonal, rows} ->
      Enum.map(rows, fn row -> Map.get(bishops_map, diagonal, []) ++ [{row, diagonal}] end)
    end)

  Enum.reduce(attacking_pairs, 0, &(&1 + &2 - 1))
end
```