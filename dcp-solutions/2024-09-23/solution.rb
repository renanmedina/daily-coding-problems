```ruby
def estimate_pi(num_samples)
  x_coords = Array.new(num_samples) { rand(-100, 100) }
  y_coords = Array.new(num_samples) { rand(-100, 100) }

  points_inside_circle = x_coords.select do |x| (x**2 + y_coords.each_with_index.map { |y,i| y**2 }.sum).sqrt <= 1 end

  points_inside_circle.size.to_f / num_samples * 4
end

puts "3.141592",estimate_pi(1000000)
```