```ruby
def min_columns_to_remove(matrix)
  rows = matrix.size
  cols = matrix[0].size
  removed_cols = Array.new(cols, false)

  def check(row, col1, col2)
    row_char = matrix[row][col1]
    return true if (col1 == 0 || col1 < col2) && matrix[row][col2] >= row_char

    left_char = nil
    right_char = nil
    removed_cols[col1] = true

    (col1..col2).each do |i|
      char = matrix[row][i]
      break if i == cols - 1

      if !left_char || char > left_char
        left_char = char
      end

      if not right_char || char < right_char
        right_char = char
      end
    end

    return (col1 == 0 || col1 < col2) && matrix[row][col2] >= left_char
  end

  cols.times do |i|
    next if removed_cols[i]
    rows.times do |row|
      break unless check(row, i, i + 1)
    end
  end

  removed_cols.count { _1 == true }
end
```