=begin
Good morning! Here's your coding interview problem for today.
This problem was asked by Amazon.
At a popular bar, each customer has a set of favorite drinks, and will happily accept any drink among this set. For example, in the following situation, customer 0 will be satisfied with drinks 0, 1, 3, or 6.
preferences = {
    0: [0, 1, 3, 6],
    1: [1, 4, 7],
    2: [2, 4, 7, 5],
    3: [3, 2, 5],
    4: [5, 8]
}
A lazy bartender working at this bar is trying to reduce his effort by limiting the drink recipes he must memorize. Given a dictionary input such as the one above, return the fewest number of drinks he must learn in order to satisfy all customers.
For the input above, the answer would be 2, as drinks 1 and 5 will satisfy everyone
=end
def fewest_drinks(preferences)
  drinks = preferences.values.flatten.uniq
  selected_drinks = []

  until preferences.empty?
    best_drink = drinks.max_by{ |drink| preferences.count{|_, prefs| prefs.include?(drink)} }
    selected_drinks << best_drink
    preferences.delete_if { |_, prefs| prefs.include?(best_drink) }
  end

  selected_drinks
end

samples = [
  { 0 => [0, 1, 3, 6], 1 => [1, 4, 7], 2 => [2, 4, 7, 5], 3 => [3, 2, 5], 4 => [5, 8] }, # [1, 2] == 2 drinks
  { 0 => [0, 1, 3, 6], 1 => [1, 4, 3], 2 => [2, 4, 3, 5], 3 => [3, 2, 5], 4 => [3, 8] }, # [3] == 1 drinks
  { 0 => [1], 1 => [2], 2 => [3], 3 => [4], 4 => [5] }, # [1, 2, 3, 4, 5] == 5 drinks (worse case scenario)
]

samples.each do |sample|
  best_drinks_to_serve = fewest_drinks(sample)
  puts "The fewest number of drinks to satisfy all customers are: #{best_drinks_to_serve} (#{best_drinks_to_serve.count} drinks)"
end

