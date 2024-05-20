=begin
Good morning! Here's your coding interview problem for today.
This problem was asked by Nvidia.
Find the maximum of two numbers without using any if-else statements, branching, or direct comparisons.
=end

def max_of_two(a, b)
  diff = a - b
  sign = (diff >> 31) & 0x1
  a - sign * diff
end

samples = [
  { a: 10, b: 20 },
  { a: 12, b: 6 },
  { a: 15, b: 8 },
  { a: 16, b: 523 }
]

samples.each do |sample|
  num1 = sample[:a]
  num2 = sample[:b]
  puts "Maximum of #{num1} and #{num2} is: #{max_of_two(num1, num2)}"
end