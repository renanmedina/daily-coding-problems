=begin
This problem was recently asked by Google.
Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
Bonus: Can you do this in one pass?
=end

require 'set'

def has_summable_pairs?(numbers_list:, target:)
  visited_numbers = Set.new

  numbers_list.each do |number|
    target_diff = target - number
    return true if visited_numbers.include?(target_diff)

    visited_numbers << number
  end

  false
end

samples = [
  { list: [10, 15, 3, 7], target_value: 17 }, # yes (10 + 7)
  { list: [2, 67, 23, 1], target_value: 12 }, # no
  { list: [25, 35, 82, 175], target_value: 210 }, # yes (175 + 35)
  { list: [9, 14, 22, 6, 78, 74, 96, 102, 325, 120], target_value: 28 }, # yes (22 + 6)
  { list: [74, 25, 98, 45, 6, 9, 4, 548], target_value: 2 } # no
]

samples.each do |sample|
  numbers = sample[:list]
  target_value = sample[:target_value]
  puts "The list #{numbers.join(', ')} has a pair that sums to target #{target_value} ?: #{has_summable_pairs?(numbers_list: numbers, target: target_value) ? "Yes" : "No"}"
end