```elixir
defmodule Solution do
  @spec find_word(list(list(char)), String.t()) :: boolean
  def find_word(grid, word) when is_binary(word) do
    directions = [[0, -1], [0, 1], [-1, 0], [1, 0]]
    find(grid, word, 0, 0, directions)
  end

  @spec find(list(list(char)), String.t(), pos_integer | nil, list(t()), list(t())) :: boolean
  defp find(grid, word, i, j, direction) when is_binary(word) do
    if i < 0 or i >= length(grid) or j < 0 or j >= Enum.at(grid, i) |> Enum.at(j) do
      false
    else
      top = Enum.at(grid, i)
      top_j = Enum.at(top, j)

      if word == "" and i == @0 and j == @0, do: true

      char = Enum.at(word, 0)

      case char do
        ?_ when is_binary(char) ->
            # skip empty string
            false
          char when top_j != char ->
            # not found
            false
          _ ->
            for direction <- direction do
              new_i = i + direction[0]
              new_j = j + direction[1]

              if new_i == @0 or new_j == @0, do: true

              result = find(grid, String.trim_to_char(word, 1), new_i, new_j, [direction | direction])
              case result do
                false -> false
                true -> true
              end
            end
      end
    end
  end
end
```