=begin
Good morning! Here's your coding interview problem for today.
This problem was asked by Google.
Given a list of integers S and a target number k, write a function that returns a subset of S that adds up to k. If such a subset cannot be made, then return null.
Integers can appear more than once in the list. You may assume all numbers in the list are positive.
For example, given S = [12, 1, 61, 5, 9, 2] and k = 24, return [12, 9, 2, 1] since it sums up to 24
=end
def subset_for_target(input:, target:)
  find_subset = lambda{|nums, target_sum, index, current_subset, result|
    if target_sum.zero?
      result << current_subset.dup
      return
    end

    return if target_sum.negative? || index == nums.length

    current_subset << nums[index]
    find_subset.call(nums, target_sum - nums[index], index + 1, current_subset, result)

    current_subset.pop
    find_subset.call(nums, target_sum, index + 1, current_subset, result)
  }

  subsets = []
  find_subset.call(input, target, 0, [], subsets)
  subsets.empty? ? nil : subsets.first
end

samples = [
  { input: [12, 1, 61, 5, 9, 2], target: 24 }, # [12, 1, 9, 2]
  { input: [2, 67, 23, 1], target: 655 }, # not found
  { input: [9, 14, 22, 6, 78, 74, 96, 102, 325, 120], target: 196 }, # [14, 6, 74, 102]
  { input: [74, 25, 98, 45, 6, 9, 4, 548], target: 49 }, #[45, 4]
  { input: [4, 68, 86, 42, 15, 19, 63, 74], target: 95 } # not found,
]

samples.each do |sample|
  subset = subset_for_target(input: sample[:input], target: sample[:target])
  puts "Subset sum for target #{sample[:target]} from [#{sample[:input].join(', ')}]: [#{subset.nil? ? 'Not found' : subset.join(', ')}]"
end