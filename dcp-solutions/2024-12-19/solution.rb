```ruby
def min_steps(points)
  # Check if there are at least two points
  raise ArgumentError.new('At least two points required') unless points.size >= 2

  # Initialize visited set and total steps
  visited = Set.new([points[0]])
  total_steps = 0

  (1...points.size).each do |i|
    x, y = points[i]
    current_point = points[i - 1]

    # Find the distance between current point and next point in all eight directions
    distances = [
      ((x + 1) - current_point[0]).abs + ((y + 1) - current_point[1]).abs,
      ((x - 1) - current_point[0]).abs + ((y + 1) - current_point[1]).abs,
      ((x - 1) - current_point[0]).abs + ((y - 1) - current_point[1]).abs,
      ((x + 1) - current_point[0]).abs + ((y - 1) - current_point[1]).abs,
      (2 * (current_point[0] - x)).abs + ((y - 1) - current_point[1]).abs,
      (2 * (current_point[0] + 1)).abs + ((y - 1) - current_point[1]).abs,
      (2 * (current_point[0] + 1)).abs + ((y + 1) - current_point[1]).abs,
      (2 * (current_point[0] - 1)).abs + ((y + 1) - current_point[1]).abs
    ]

    # Find the minimum distance
    min_distance = distances.min

    # Add the minimum distance to total steps and add next point to visited set
    total_steps += min_distance
    visited << [x, y]
  end

  return total_steps
end
```