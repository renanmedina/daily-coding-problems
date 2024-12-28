```elixir
defmodule SegregateArray do
  @spec segregate([char]) :: list(char)
  def segregate(arr) when is_binary(arr) do
    arr = String.split(arr, "")
    segrete_arr = Enum.map(arr, &case &1 do
      "R" -> "X"
      "G" -> "Y"
      _ -> nil end)
    segrete_arr = Enum.filter(segretre_arr, fn x -> !is_nil(x) end)
    segrete_arr
  end

  def segregate(arr) when is_list(arr) do
    if length(arr) <= 1 do
      arr
    else
      first_element = List.first(arr)
      tail = List.drop(arr, 1)

      cond do
        first_element == "R" ->
          [first_element | segregate(tail)]
        first_element == "G" ->
          [first_element | segregate(tail) | segregate([nil])]
        first_element == "B" ->
          [first_element | segregate(tail) | segregate(nil: tail)]
      else
        segregate([first_element | segregate(tail)])
      end
    end
  end

end
```