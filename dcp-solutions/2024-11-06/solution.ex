```elixir
defmodule BreakStringIntoLines do
  def break_string(s, k) when is_binary(s) and is_integer(k) do
    words = s |> String.split(" ") |> Enum.map(&(&1/0))
    cond do
      Enum.any?(words, &is_binary/1) -> nil
      Enum.any?(Enum.zip(words, [k | tail]), fn {x, y} -> x > y end) -> nil
      Enum.count(Enum.zip(words, [k | tail]), fn {x, _} -> x == k end) == 0 ->
        words
      else
        Enum.reduce([1], words, fn acc, word ->
          if Enum.any?(Enum.zip(acc, [word | rest]), fn {_1, y} -> y > 1 end) do
            acc ++ [word]
          else
            [word] ++ acc
          end
        end)
      end
    end
  end
end
```