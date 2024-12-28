```elixir
defmodule GraphPaths do
  @doc """
  This function calculates the largest value path in a directed graph.

  Args:
    graph (String): A string representing the uppercase letters of nodes.
    edges (List(tuple)): A list of tuples, where each tuple contains two integers representing the source and destination node indices.

  Returns:
    Integer or nil: The size of the largest path with most frequent letter, or nil if there's an infinite loop.
  """
  def largest_path_value(graph, edges) do
    # Create a map to store adjacency list for graph
    adj_list = Enum.reduce(edges, %{}, fn {u, v}, acc ->
      Map.put_new(acc, u, [v])
    end)

    # Initialize the visited nodes and edges count to keep track of infinite loops
    visited = %{}
    edge_count = %{}

    def traverse(node, path, max_value) when node in visited do
      # If we've already visited this node, it means there's an infinite loop
      nil
    end

    def traverse(node, path, max_value) do
      # Mark the current node as visited and increment its edge count
      visited[node] = true
      edge_count[node] = (edge_count[node] || 0) + 1

      # If all edges are self-edges or there's an infinite loop, return nil
      if edge_count[node] == 0 do
        nil
      end

      # Calculate the value of the current path by counting the most frequent letter
      value = case Enum.count(Enum.groupby(path, &(&1)), fn group -> Map.get(group, :charlist, []) end) do
               [] -> 0
               _ -> Enum.max(Enum.map(Enum.groupby(Enum.concat(Enum.groupby(path, &(&1))), &(&1>>, []),
                                    fn group -> List.first(group) end))
           end

      # Recursively traverse the neighbors of the current node
      result = Enum.reduce(adj_list[node], nil, fn {n, list}, acc ->
        traverse(n, [node | path], max([max_value, value]))
      end)

      # Update the maximum value and return it if it's larger than any previous ones
      case result do
        nil -> max_value
        _when is_nil(result) -> max_value
        nil -> 0
        val ->
          cond do
            val > max_value -> val
            true -> max_value
          end
      end
    end

    # Initialize the maximum value to negative infinity
    max_value = -Inf

    # Traverse all nodes in the graph
    Enum.reduce(Enum.map(graph, fn char -> [char] end), nil, fn node, acc ->
      traverse(node, [], 0)
      cond do
        is_nil(acc) -> nil
        val when val > max_value -> max_value = val
        true -> max_value
      end
    end)

    # Return the maximum value or nil if there's an infinite loop
    case max_value do
      -Inf -> nil
      ^max_value ->
        cond do
          max_value == Inf -> nil
          true -> max_value
        end
      _when is_nil(max_value) -> nil
      val -> val
    end
  end
end
```