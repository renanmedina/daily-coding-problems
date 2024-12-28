```elixir
defmodule StaircaseClimber do
  @doc """
  Calculates the number of unique ways to climb N stairs, where you can climb any number from X.

  ## Example
  iex> staircase_climber.2(3)
  4

  iex> staircase_climber.3({1, 3, 5})
  10
  """
  def climb(n, x) when n == 0 do
    1
  end

  def climb(0, _), do: 0

  def climb(n, x) do
    Enum.reduce(x, 0, fn(step, acc) ->
      climb(n - step, x) + acc
    end)
  end
end
```