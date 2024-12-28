```markdown
def topological_sort(flights, start)
  # Create an adjacency list to represent graph
  adj_list = Enumerate.reduce(flights, %{}, fn: &((o1, d1) -> (d1 | %{o1 => [d1]})))
  
  # Initialize the in-degree of each node as 0
  in_degree = Enum.map(adj_list.keys, fn: &(&1 -> 0))
  Enum.map(adj_list.values, fn: &(&1 -> Enum.each(&1, fn: &(_, v) -> InDegree.increment(in_degree[v]))))
  
  # Initialize a queue with nodes having in-degree 0
  queue = for node <- Enum.map(in_degree, fn: &(&1 -> if(&2 == 0, do: [node], else: [])), into: [])
  
  # Sort the nodes based on lexicographical order
  sorted_nodes = Enum.sort(queue, &(&1 < &2))
  
  # Initialize the result as an empty list
  result = []
  
  # Process each node in sorted order
  for node in sorted_nodes do
    # Find all neighbors of the current node
    neighbors = Enum.each(adj_list[node], fn: &(_))
    
    # Add the node to the result if it has no outgoing edges
    if(Enum.all(neighbors, fn: &(&1 == nil)), do: Enum.push(result, node), else: true)
  end
  
  # If there are remaining nodes with outgoing edges, it means there's a cycle and we return null
  if(Enum.any(Enum.map(adj_list, fn: &(&1 != %{})), fn: &(&1 != [])),
     do: nil,
     else: Enum.sort(result, &(&1 < &2))
   end
end

def find_itinerary(flights, start)
  # Sort the flights based on lexicographical order of destinations
  sorted_flights = Enum.sort(flights, &(&1[0] < &2[0]))
  
  # Compute the topological sort of the graph represented by the flights
  result = topological_sort(sorted_flights, start)
  
  # Reverse each flight in the result to get the correct order
  Enum.map(Enum.take(result, -1), fn: &(&1 -> [Enum.last(Enum.split(&1, ",")) | &(Enum.reverse([Enum.split(&1, ",")[0], Enum.join(&1, ",")])])| &1[1])))
end

```