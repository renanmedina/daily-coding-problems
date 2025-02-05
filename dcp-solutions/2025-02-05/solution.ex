```elixir
defmodule GrayCode do
  def generate(n) when is_integer(n) and n >= 0 do
    # Handle edge cases
    if n == 0, do: [""]
    else
      gray = Enum.map(GrayCode.generate(n - 1), fn x ->
        # Generate the current bit (either 0 or 1)
        # The carry-over from the previous bits is also either 0 or 1
        [to_string(Enum.at(x, 0) || <<>>, to_string(Enum.at(Enum.at(x, 0) || <<>>, -1)) ++ Enum.map(GrayCode.generate(n - 1), fn x -> to_string(Enum.at(x, 0) || <<>>, to_string(Enum.at(Enum.at(x, 0) || <<>>, -1))) end]
      end)
      Enum.sort(gray)
    end
  end

  def generate(_), do: nil
end
```