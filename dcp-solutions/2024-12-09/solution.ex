```elixir
defmodule UniformRandomPicker do
  @doc false
  def pick_uniform(n, l) when n <= 0, do: raise("n must be greater than 0")
  def pick_uniform(0, _), do: nil

  def pick_uniform(n, l) do
    remaining = Enum.uniq([n | tail] ++ l)
    if length(remaining) < 1, do: nil
    else
      n - 1 in remaining && pick_uniform(n-1, [head(elem(remaining, 0)) | tail(remaining)])
    end
  end
end
```