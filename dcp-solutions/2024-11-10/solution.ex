```elixir
defmodule Exponentiation do
  @doc """
  Calculate x raised to y.
  This function uses exponentiation by squaring to improve efficiency.

  ## Example
  iex> Exponentiation.pow(2, 10)
  1024
  """
  def pow(x, y) when y == 0 do
    1
  end

  def pow(x, 0) do
    1
  end

  def pow(x, y) when is_integer(y) do
    x ^ (y / 2)
    |> float()
    |> sqrt()
    |> Integer.sqrt()
    |> Integer.pow(x, rem(y, 2))
  end

end
```