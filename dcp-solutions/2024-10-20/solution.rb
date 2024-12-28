```ruby
def findItinerary(flights, start)
  graph = flights.group_by { |s, d| s }.map { |_, destinations| [destinations.first, destinations.map(&:last)] }
  
  def dfs(cur, path)
    return [] if cur == start
    path << cur
    graph[cur].sort_by! { |d| -1 } # sort destinations in reverse lexicographical order
    
    while not graph[cur].empty? and graph[cur][0][0] != start
      result = dfs(graph[cur][0][0], path)
      return result if result
      graph[cur].shift
    end
    
    if graph[cur].empty?
      path.pop # backtracking
      []
    else
      d1, d2 = graph[cur].first
      result = [d1] + dfs(d1, path) + [d2]
      return result
    end
  end
  
  if graph[start].empty? and start == flights.map { |s, _| s }.uniq[0]
    return nil
  end
  
  result = dfs(start, [])
  
  unless result
    # no valid itinerary exists
    return []
  end
  
  # lexicographically smallest itinerary in reverse order
  result.reverse!
end
```