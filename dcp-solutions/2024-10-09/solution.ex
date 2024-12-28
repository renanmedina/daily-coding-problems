```elixir
def calculate_water_trapped(heights) do
  # Initialize variables to keep track of maximum heights on left and right sides
  max_left = Enum.max(Enum.map(heights, fn height -> height end))
  max_right = Enum.max(Enum.reverse(heights))

  # Calculate the water that can be trapped between each wall
  Enum.reduce(1..length(heights), 0, fn i, result ->
    # Calculate the minimum height of left and right walls at current index
    min_height = [heights[i-1], max_left, max_right]
      |> Enum.min()

    if heights[i] >= min_height do
      result
    else
      # If water can't be trapped at current index, add zero to the result
      result + (min_height - heights[i]) * 2
    end
  end)
end
```