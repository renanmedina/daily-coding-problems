```elixir
def calculate_steps(points) do
  points = Enum.map(points, fn point -> [point] end)
  |> Enum.map(&get_distance/1)
  |> List.reduce(0, &add/2)

  def get_distance([x1, y1 | tail]), do: abs(x1 - head(tail)) + abs(y1 - head(tail))
  def get_distance([x1, y1]), do: abs(x1) + abs(y1)
  def get_distance([]), do: 0

  def add(num1, num2), do: num1 + num2
end
```