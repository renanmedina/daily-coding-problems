=begin
This problem was asked by Facebook.
Given three 32-bit integers x, y, and b, return x if b is 1 and y if b is 0, using only mathematical or bit operations. 
You can assume b can only be 1 or 0.
=end

def bitwise_return(x:, y:, b:)
  # if b == 1, the x * 1 == x
  x_math = (x * b)
  # if b == 0, then y * (1 - 0) == y
  y_math = (y * (1 - b))

  x_math | y_math ## bitwise OR
end

samples = [
  {x: 20, y: 40, b: 1}, # 20
  {x: 20, y: 40, b: 0}, # 40,
  {x: 12, y: -28473, b: 0}, # -28473
  {x: 23, y: 2348, b: 1}, # 23
  {x: 56, y: 340, b: 0} # 340
]

samples.each do |input|
  asnwer = bitwise_return(x: input[:x], y: input[:y], b: input[:b])
  puts "Bitwise return for #{input[:x]} and #{input[:y]} when b = #{input[:b]} is: #{asnwer}"
end