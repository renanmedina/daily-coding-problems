```ruby
def spiral_matrix(matrix)
  rows, cols = matrix.size
  visited = Array::NULL * rows * cols
  directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  row, col, dir_idx = 0, 0, 0

  while row < rows && col < cols
    (0...rows).each do |i|
      next if visited[i * cols + col]
      print matrix[i][col], " "
      visited[i * cols + col] = true
    end
    col += directions[dir_idx][1]
    next unless col < cols && !visited[row * cols + col]

    (0...cols).each do |i|
      next if visited[i * cols + row]
      print matrix[row][i], " "
      visited[i * cols + row] = true
    end
    row += directions[dir_idx][0]
    next unless row < rows && !visited[(row - 1) * cols + col]

    (cols - 1).downto(0).each do |i|
      next if visited[i * cols + row]
      print matrix[row][i], " "
      visited[i * cols + row] = true
    end
    row -= directions[dir_idx][0]
    next unless row >= 0 && !visited[(row + 1) * cols + col]

    (rows - 1).downto(0).each do |i|
      next if visited[i * cols + col]
      print matrix[i][col], " "
      visited[i * cols + col] = true
    end
    col -= directions[dir_idx][1]
    next unless col >= 0 && !visited[(row - 1) * cols + (col - 1)]

    dir_idx = (dir_idx + 1) % 4
  end

  print "\n"
end

matrix = [
  [1, 2, 3, 4, 5],
  [6, 7, 8, 9, 10],
  [11, 12, 13, 14, 15],
  [16, 17, 18, 19, 20]
]

spiral_matrix(matrix)
```