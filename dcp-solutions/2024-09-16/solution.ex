```elixir
defmodule Decode Ways do
  @spec decode_ways(String.t()) :: non_neg_integer
  def decode_ways(message) when byte_size(message) == 0, do: 0
  def decode_ways("0"), do: 0
  def decode_ways(message), do: Enum.reduce(1..byte_size(message)-1, 0, fn i, acc ->
    # If the first two characters are not '00', we can always add them to the current number of ways.
    if String.slice(message, 0, 2) != "00", do: acc + 1
    # Otherwise, we need to check whether the next character is '0' or '1'.
    else Enum.at(message, i+1) == "0" ? acc : acc + 2 end)
end
```