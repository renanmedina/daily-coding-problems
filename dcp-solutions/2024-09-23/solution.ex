```elixir
defmodule CircleArea do
  @total_points 10000
  def estimate_area() do
    points_inside_circle =
      Enum.map(1..@total_points, fn _ ->
        x = -1 + random.uniform(2) # Randomly generate a point in the square [-1, 1]x[-1, 1]
        y = -1 + random.uniform(2)
        x * x + y * y <= 1
      end)

    Enum.count(points_inside_circle) / @total_points * 4
  end

  defp random(), do: rand() / 32768.0
end

IO.inspect(CircleArea.estimate_area())
```