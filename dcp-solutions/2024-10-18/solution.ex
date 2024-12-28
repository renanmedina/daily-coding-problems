```elixir
defmodule ConwayGameOfLife do
  @directions [
    {0, 1},
    {0, -1},
    {1, 0},
    {-1, 0},
    {1, 1},
    {-1, -1},
    {1, -1}, {-1, 1}
  ]

  def start_live_cells(initial_cells, steps) do
    live_cells = Map.new(initial_cells)
    for _ <- 1..steps, do: process_live_cells(live_cells)
    live_cells
  end

  defp process_live_cells({cell_coords, board}) do
    new_board = Enum.map(cell_coords, fn {x, y} ->
      alive_neighbours = count_alive_neighbours(x, y, board)
      cond do
        board[{x, y}] == :alive -> if alive_neighbours in [2..3], do: :alive, else: :dead
        true -> :dead
      end
    end)
    cond do
      new_board == board -> print_state(new_board, cell_coords)
      true ->
        new_cell_coords = Enum.map(new_board, fn :live -> [{x, y}] end, fn :dead -> [] end)
          |> Map.merge(cell_coords)
        process_live_cells(Map.put(new_cell_coords, board: new_board), steps - 1)
    end
  end

  defp count_alive_neighbours(x, y, board) do
    Enum.sum(Enum.map(@directions, fn {dx, dy} -> count_alive_adjacent({x + dx, y + dy}, board) end))
  end

  defp count_alive_adjacent({x, y}, board) when is_integer(x), is_integer(y), do: cond do
    Map.get(board, {:x, x}, :dead) == :alive -> 1
    true -> 0
  end

  defp print_state(_, cell_coords) do
    Enum.map(cell_coords, fn {x, y} ->
      if is_integer(x), is_integer(y),
         do: "\e[2J"
      else
        " \n"
      end
    end)
    |> Enum.join("\n")
    |> IO.println
  end
end
```