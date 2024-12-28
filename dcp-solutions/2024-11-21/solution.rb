```ruby
def largest_path_value(graph_str, edges)
  # Create a graph with adjacency list representation
  graph = {}
  nodes = graph_str.size
  (0...nodes).each { |i| graph[i] = [] }
  
  # Populate the adjacency list
  edges.each do |edge|
    from, to = edge
    graph[from].push(to)
  end
  
  # Initialize a distance matrix with all values set to -1
  dist = Array.new(nodes) { [-1, 0] }
  
  # Define a recursive function for DFS
  def dfs(node, path_value)
    # If we've already visited this node or the current value is greater than the known distance
    return [path_value, -1] if dist[node][1] >= 0 || path_value > dist[node][1]
    
    # Update our distance and store it in the matrix
    dist[node] = [path_value, node]
    
    # Recursively visit all neighbors of the current node
    graph[node].each do |neighbor|
      value, neighbor_node = dfs(neighbor, path_value + 1)
      return [value, neighbor_node] if value >= 0
    end
    
    # If we can't find a way to continue from any neighbor
    [-1, -1]
  end
  
  # Find the largest possible path and check for infinite loops
  (0...nodes).each do |node|
    value, node = dfs(node, 1)
    
    return [value, nil] if value < 0
    
    # If we've found a cycle, return null
    next_node = dist[node][1]
    path_value, _ = dist[next_node]
    return [-1, nil] unless path_value >= 0
  end
  
  # Return the largest value of any path
  dist.values.map { |value| value[0] }.max || -1
end
```