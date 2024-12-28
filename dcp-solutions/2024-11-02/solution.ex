```elixir
defmodule Sudoku do
  @doc """
  Solves a Sudoku puzzle.
  """
  defsolve(grid) do
    %__MODULE__{grid: grid}
    |> solve()
    |> cond do
      is_nil(@)
      nil
    end
  end

  @spec solve(__MODULE__.t()) :: __MODULE__.t() | nil
  def solve(%{grid: []} = state), do: state
  def solve(state) do
    for row <- 0..8, elem(state.grid[row], 9) in [nil|number], do: number do
      new_state =
        Enum.replaceAtIndex(row, elem_index(state.grid, row, number), nil)
        |> Map.put(:grid, List.insert(state.grid, new_state))
      end
      solve(new_state)
    end
  end

  @spec is_valid(__MODULE__.t(), integer) :: boolean
  def is_valid(%{grid: grid}, number) do
    for i <- 0..8,
        elem_index(grid, i, number),
        in: [number|nil],
        do: false
   end
      |> Enum.any?()
  end

  @spec solve_box(__MODULE__.t(), integer) :: nil | %__MODULE__
  def solve_box(%{grid: grid}, row, col) do
    %box_state{
      grid: grid,
      number: nil,
      row: row,
      col: col
    } |> solve()
    |> case do
      box_state%box_state{number: nil} ->
        nil
      _ -> box_state
    end
  end

  def elem_index(grid, row, number), do: Enum.find_index(grid[row], &(&1 == number))
  def elem_index([], _row, _number), do: -1

  @type box_state %{grid: list(list(integer)), number: nil | integer, row: non_negative_integer(), col: non_negative_integer()}
  type box_state
end
```