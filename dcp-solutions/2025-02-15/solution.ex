```elixir
defmodule Solution do
  @spec count_ways(matrix :: [[i]) :: non_neg_integer
  defcount_ways(matrix = [[_| _ | _] = matrix]), acc \\ 1, row \\ 0 in
    if row == length(matrix) - 1 and column == length(matrix[0]) - 1 do
      acc
    else
      cond do
        matrix[row][column] == 0 ->
          count_ways(matrix, [acc * 2, 1], row + 1, column)
        true ->
          count_ways(matrix, [acc, 1], row, column + 1)
      end
    end
  end

  defcount_ways(matrix = [[_ | _] = matrix]), acc \\ 0, row \\ 0 do
    cond do
      matrix[row][column] == 0 ->
        count_ways(matrix, [acc * 2, 1], row + 1, column)
      true ->
        count_ways(matrix, [acc, 1], row, column + 1)
    end
  end

  defcount_ways([]), 0
end
```