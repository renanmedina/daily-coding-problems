```ruby
def total_knights_tours(n)
  # If n is odd, there are no knight's tour possible
  return 0 if n.even?

  # Number of ways to color the chessboard with two colors
  colorings = [1, 2]
  # Number of knights for each square
  num_knights = [[-2, -1], [-2, 1], [-1, -2], [-1, 2],
                 [ 1, -2],   [ 1, 2],    [ 2, -1],   [ 2, 1]]

  # Number of tours ending at each square
  tours = Array.new(n*n, 0)
  colorings.each do |c|
    visited = Array.new(8, false)
    (0...n).each do |i|
      (0...n).each do |j|
        next if i == j

        next if (i-1)+j == c or i+j == c
        next unless !visited.any? && ((i-1)+j != c) && ((i+j) != c)

        color = visited.count { _1 }
        tours[((i*8)+j)] += 2**color
        visited[i*4+j] = true

        (0...8).each do |k|
          next unless (num_knights[k][0]*2 + i <= n-1) && (num_knights[k][1]*2 + j <= n-1)

          x, y = i+num_knights[k][0], j+num_knights[k][1]
          color += 1 unless tours[((x*8)+y)] > 0

          new_coloring = (c << 1) | color
          tours[((x*8)+y)] += (2**new_coloring - 1)/3
        end
      end
    end
  end

  # Return all tours ending at each square, then divide by 2 for each coloring and multiply for number of knight squares.
  tours.sum
end
```