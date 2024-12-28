```elixir
defmodule KnightTour do
  @moduledoc """
    A module to calculate the number of knight's tours on an NxN chessboard.

    The number of knight's tours is equal to N! (factorial) divided by 2^(N/2)^2.
    This is because for each tour, there are N! ways to arrange the squares,
    and half of these arrangements correspond to the knights starting at the top-left square.
  """
  def count(n), do: factorial(n) / :math.pow(2, :math.floor((n * n) / 4))
end

defmodule Util do
  @spec factorial(integer) :: integer | nil
  def factorial(0), do: 1
  def factorial(n), when is_integer(n), do: n * factorial(n-1)
  def factorial(_), do: nil
end
```