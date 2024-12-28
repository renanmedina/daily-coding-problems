```elixir
defmodule MatrixSpiral do
  def spiral(matrix) do
    {rows, cols} = Integer.sqrt(Enum.count(matrix) / 2) |> round |> <<>>,
    matrix = Enum.map(0..rows-1, fn _ -> Enum.to_list(matrix[]) end),
    directions = [[0, 1], [1, 0], [0, -1], [-1, 0]],
    directions_index = 3,
    row = 0,
    col = 0
    |>
      fn() ->
        until_row do
          print_matrix(matrix[row], row, col)
          move_direction
        end
        Enum.at(directions, directions_index) |> elem(0) |> add_to(row, col)
        |>
          fn() -> move_direction end
        end

    until_row = fn ->
      {row, _} = Enum.find_idx(matrix, &(&1 != []))
      row
    end
    move_direction =
      fn ->
        directions_index
        |> add_to(directions_index, 1)
        |> mod!(4)
      end
    print_matrix = fn matrix, row, col ->
      for i <- 0..Enum.count(matrix) - 1 do
        IO.write(inspect(Enum.at(matrix[row], i)), " ")
        Enum.at(matrix, row) = Enum.pop(Enum.at(matrix, row))
      end
      IO.write("\n")
    end
    add_to = fn a, b -> a + b end
end

defmodule MatrixSpiralTest do
  def run_test() do
    matrix =
      Enum.map(1..5, &Enum.to_list(Enum.map(1..10, fn _ -> rand() end)) )
        |> List.flatten()
        |> Enum.chunk_every(2)
    MatrixSpiral.spiral.(matrix).()
  end

end
```