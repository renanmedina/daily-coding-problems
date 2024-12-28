```ruby
def shortest_path(matrix, start, end)
  m, n = matrix.size, matrix[0].size
  directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  queue = [(start, 0)]
  
  visited = Array.new(m) { Array.new(n, false) }
  visited[start[0]][start[1]] = true
  
  while queue.any?
    (x, y), dist = queue.pop
    return dist if x == end[0] && y == end[1]
    
    directions.each do |dx, dy|
      nx, ny = x + dx, y + dy
      next unless nx >= 0 && nx < m && ny >= 0 && ny < n && !matrix[nx][ny]
      new_x, new_y = nx.abs, ny.abs
      new_dist = dist + 1 + new_x + new_y
      new_x /= 2
      new_y /= 2
      return new_dist unless visited[new_x][new_y]
      queue << ([new_x, new_y], new_dist)
      visited[new_x][new_y] = true
    end
  end
  
  nil
end
```