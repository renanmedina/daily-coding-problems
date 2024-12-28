```elixir
defmodule MinCostRow {
  @doc """
  Calculate the minimum cost to build a row of houses with K different colors,
  ensuring no two neighboring houses are of the same color.

  Args:
    cost (list[list]): A 2D list where cost[n][k] represents the cost to build
      the nth house with kth color.

  Returns:
    int: The minimum cost that achieves the goal.
  """
  @spec min_cost(list[List.i32]) :: i32
  def min_cost(cost) when is_list(cost) do
    # Get number of rows and colors
    {n, k} = Enum.count(cost, &(&1 | []))

    # Initialize dp table with cost of first house as each color's cost
    dp = List.duplicate(nil, n)

    # Base case: First house can be built in any color
    for i <- 0..k - 1 do
      dp[0][i] = cost[0][i]
    end

    # Fill up dp table row by row
    for i <- 1..n - 1 do
      # Initialize min_cost with infinity
      min_cost = :math.inf()
      # Iterate through each color (except last color)
      for j <- 0..k - 2 do
        # Calculate cost of building current house in this color
        # and previous house in another color, then update min_cost
        cost_i = dp[i - 1][j] + cost[i][j + 1]
        cost_j = dp[i - 1][j + 1] + cost[i][j]
        min_cost = min(min_cost, cost_i, cost_j)
      end

      # Fill up dp table with minimum cost
      for j <- 0..k - 1 do
        dp[i][j] = min_cost
      end
    end

    # Return minimum cost of building all houses
    Enum.sum(dp[n - 1])
  end
}
```