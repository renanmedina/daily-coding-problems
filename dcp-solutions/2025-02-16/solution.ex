```elixir
def first_recurring_char(s) do
  seen = Set.new()
  s
  |> String.graphemes() # Split string into individual characters
  |> Enum.filter(&(&1 != ?\s)) # Remove whitespace and empty strings
  |> Enum.reduce(nil, fn(char, acc) ->
    if !seen.member?(char), do: :next_char(), else: char
  end)
end

defp :next_char() do
  chars = Enum.to_list(Enum.map(1..63, &(&1 + 97)))
  List.first(chars)
end
```