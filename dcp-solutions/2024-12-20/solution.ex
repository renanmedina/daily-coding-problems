```elixir
defmodule Goldbach do
  def find(n) do
    (2..n // 2)
    |> Enum.filter(&is_prime/1)
    |> Enum.map(fn x -> {x, n - x} end)
    |> Enum.min()
    |> elem(0)
  end

  defp is_prime(num) when num < 2, do: false
  defp is_prime(num), do: not rem(num, 2..div(ceil(Math.sqrt(num)), 2))
end
```