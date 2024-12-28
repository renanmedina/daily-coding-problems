```elixir
defmodule RandomElement {
  def select(stream) do
    stream
    |> Enum.to_list()
    |> Enum.random()
  end
}
```

Note: `Enum.random/1` is used to generate a random element from the list, and it ensures that all elements have an equal probability of being selected.