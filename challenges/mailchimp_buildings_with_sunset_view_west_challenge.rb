=begin
Good morning! Here's your coding interview problem for today.
This problem was asked by Mailchimp.
You are given an array representing the heights of neighboring buildings on a city street, from east to west. 
The city assessor would like you to write an algorithm that returns how many of these buildings have a view of the setting sun, 
in order to properly value the street.

For example, given the array [3, 7, 8, 3, 6, 1], you should return 3, since the top floors of the buildings with heights 8, 6, and 1 
all have an unobstructed view to the west.
Can you do this using just one forward pass through the array?
=end

def buildings_with_sunset_view(buildings:)
  i = buildings.count - 2
  biggest_height = buildings.last

  [biggest_height].tap do |solution_buildings|
    while i > -1
      building_height = buildings[i]
      if building_height > biggest_height
        solution_buildings << building_height
        biggest_height = building_height
      end
      i -= 1
    end
  end
end

samples = [
  [3, 7, 8, 3, 6, 1],
  [4, 9, 15, 10, 12],
  [1, 2, 3, 4, 5, 6],
  [25, 13, 32, 10, 8],
  [65, 13, 32, 10, 8],
]

samples.each do |sample|
  solution = buildings_with_sunset_view(buildings: sample)
  puts "The buildings with sunset view from [#{sample.join(', ')}] are: [#{solution.join(', ')}] (count: #{solution.count})"
end