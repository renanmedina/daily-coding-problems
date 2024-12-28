```ruby
def numIslands(grid)
  return 0 if grid.empty?

  rows, cols = grid.size, grid[0].size
  visited = Array.new(rows) { Array.new(cols, false) }

  def dfs(r, c)
    return unless (r < 0 || r >= rows || c < 0 || c >= cols || visited[r][c] || grid[r][c] == '0')
    visited[r][c] = true
    dfs(r - 1, c)
    dfs(r + 1, c)
    dfs(r, c - 1)
    dfs(r, c + 1)
  end

  (0...rows).each do |r|
    (0...cols).each do |c|
      return count = 1 if grid[r][c] == '1' && !visited[r][c]
      dfs(r, c) unless grid[r][c] == '0'
      visited[r][c] = true
      count += 1 if grid[r][c] == '1'
    end
  end

  count
end
```