```elixir
defp count_islands(matrix) when is_list(matrix) do
  # Create a copy of the matrix to keep track of visited cells
  new_matrix = Enum.map(matrix, fn row -> Enum.map(row, &(&1)) end)

  # Function to mark an island as visited by changing its value to -1
  defp mark_visited(new_matrix, i, j) do
    if i < 0 or i >= length(new_matrix) || j < 0 or j >= length(new_matrix[0]) do
      # Out of bounds, skip it
    else
      # Mark the cell as visited by changing its value to -1
      new_matrix[i][j] = -1

      # Recursively mark all neighboring cells
      mark_visited(new_matrix, i + 1, j)
      mark_visited(new_matrix, i - 1, j)
      mark_visited(new_matrix, i, j + 1)
      mark_visited(new_matrix, i, j - 1)
    end
  end

  # Initialize the island count
  islands = 0

  # Iterate over each cell in the matrix
  Enum.each(matrix, fn row ->
    Enum.each(row, fn val ->
      if val == 1 do
        # Reset the visited cells for a new island
        mark_visited(new_matrix, i, j)

        # Increment the island count
        islands = islands + 1
      end
    end)
  end)

  islands
end

defimpl String.to_string do
  def to_string({:matrix, matrix}) when is_list(matrix) do
    Enum.join(matrix, "\n")
  end
end
```