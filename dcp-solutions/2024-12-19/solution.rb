```ruby
def min_steps(points)
  # Create a set of visited points
  visited = Set.new
  
  # Initialize current position and steps
  x, y = points.first
  steps = 0
  
  while !visited.include?([x, y])
    # Mark current point as visited
    visited << [x, y]
    
    # Find next point in order
    next_point = nil
    (0..points.size - 2).each do |i|
      dx = points[i+1][0] - x
      dy = points[i+1][1] - y
      
      # If there's a shorter path to this point, skip it
      next unless [dx, dy].permutation[0] > [dx, dy].permutation[1]
      
      next_point = [points[i][0] + dx, points[i][1] + dy]
      break
    end
    
    # If no valid next point is found, break the loop
    return -1 if next_point.nil?
    
    # Calculate steps to move to next point
    step_x, step_y = next_point - [x, y]
    moves = [[-2, 0], [-1, 1], [-1, -1], [0, -2], [1, -1], [1, 1], [2, 0], [2, -1]]
    for dx, dy in moves
      if (step_x * dx).abs + (step_y * dy).abs == step_x.abs + step_y.abs
        x += dx
        y += dy
        steps += 1
        break
      end
    end
  end
  
  # Return total steps taken
  steps
end
```