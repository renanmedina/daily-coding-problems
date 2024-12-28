```elixir
defmodule PerfectNumber do
  def nth_perfect_number(n) do
    (10..1000000)
      |> Enum.drop_while(&(&1 <= 9))
      |> Enum.filter(&(&1 == sum(integers(&1))))
      |> Enum.at((n - 1) * 6)
  end

  defp integers(number) do
    case number do
      0 -> []
      _ when rem(number, 10) in [2, 5, 8] -> [number]
      _ -> [number | integers(div(number, 10))]
    end
  end

  defp sum(numbers), do: Enum.sum(numbers)
end
```