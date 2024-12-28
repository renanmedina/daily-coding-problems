```ruby
def validate_rules(rules)
  # Mapping of directions to their opposite directions
  direction_map = {
    'N' => 'S',
    'S' => 'N',
    'E' => 'W',
    'W' => 'E'
  }

  # Mapping of direction pairs to their corresponding directions
  pair_map = {
    'NE' => :north_east,
    'NW' => :north_west,
    'SE' => :south_east,
    'SW' => :south_west
  }

  stack = []

  rules.each do |rule|
    direction, a, b = rule.split

    if pair_map.key?(direction)
      dir = pair_map[direction]
      if (dir == :north_east && stack.last == :south_west) ||
         (dir == :north_west && stack.last == :south_east) ||
         (dir == :south_east && stack.last == :north_west) ||
         (dir == :south_west && stack.last == :north_east)
        return false
      end
    elsif direction_map.key?(direction)
      opposite_direction = direction_map[direction]
      if stack.last == opposite_direction
        return false
      end
    end

    stack << dir
  end

  true
end
```