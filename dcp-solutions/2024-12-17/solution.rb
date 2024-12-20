```ruby
def exist(board, word)
  m, n = board.size, board[0].size
  visited = Array.new(m) { Array.new(n, false) }
  
  def dfs(i, j, k)
    return true if k == word.length
    return false if i < 0 || j < 0 || i >= m || j >= n || !board[i][j] || visited[i][j]
    
    temp = board[i][j]
    board[i][j] = '#'
    visited[i][j] = true
    
    if dfs(i + 1, j, k + 1) || dfs(i - 1, j, k + 1) || dfs(i, j + 1, k + 1) || dfs(i, j - 1, k + 1)
      return true
    end
    
    board[i][j] = temp
    visited[i][j] = false
  end
  
  (0...m).each do |i|
    (0...n).each do |j|
      dfs(i, j, 0) if word[0] == board[i][j]
    end
  end
  
  !word.empty?
end
```