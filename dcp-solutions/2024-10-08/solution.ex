```elixir
defmodule RunLengthEncoding do
  @doc """
  Encodes a string into run-length encoding format.
  """
  def encode(input) when is_binary(input) do
    input
    |> String.graphemes()
    |> Enum.reduce([], fn(char, [{count, c} | tail]) -> [count ++ [c], |tail] end)
    |> Enum.map(&{String.duplicate(&1, &2), &3|)
  end

  @doc """
  Decodes a run-length encoded string back into the original format.
  """
  def decode(encrypted) when is_binary(encrypted) do
    encrypted
    |> String.graphemes()
    |> Enum.reduce([], fn(char, [{count, c} | tail]) -> [char ++ List.duplicate(c, count), |tail] end)
    |> Enum.map(&{String.length/1, &1})
  end

  @doc """
  Decodes a run-length encoded string back into the original format.
  """
  def decode(input) when is_list(input), do: Enum.map(input, fn[{count, char}] -> String.duplicate(char, count) end)
end
```