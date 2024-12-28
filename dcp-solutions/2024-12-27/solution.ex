```elixir
defmodule RotateString do
  def rotate(str1, str2) when str1 == str2 do
    true
  end

  def rotate(str1, str2) when byte_size(str1) != byte_size(str2), do: false

  def rotate(str1, str2) do
    char_set = MapSet.new(str1)
    Enum.any?(str1 | str2, &(&1 in char_set))
  end
end
```