```elixir
def swap_bits(n) when is_integer(n) do
  n
  |> Integer.to_string()
  |> List.duplicate(8)
  |> Enum.map(&case &1 - ?32 do
    _ when rem(&1, 2) == 0 -> ?32 + char_to_binary(&1)
    _ -> char_to_binary(~^&1)
  end)
  |> Enum.join("")
  |> Integer.parse(nil)
end
```