```elixir
defmodule Solution do
  @doc """
  This function calculates the smallest number of squared integers which sum to n.
  """
  def square_count(n) when is_integer(n) do
    # Create a list to store the results of all previously computed values of i.
    sqrt_values = [0..Math.sqrt(n)]

    # Iterate through each value from sqrt_values/1 downwards and check if it can be squared and added to a previous result.
    for i in reverse(sqrt_values), do: n
      |> Integer.sqrt()
      |> float()  # Get the floating point version of the square root
      |> trunc()   # Truncate to the nearest integer (since we are only interested in integers)
      |> if do: i in Enum.reverse(sqrt_values) ? (sqrt_count(n - i*i)) + 1 : nil end

    # Return 0 if n can not be achieved by summing of perfect squares
    case elem(n, sqrt_values) do
      nil -> 0
      _ -> 1
    end
  end
end
```