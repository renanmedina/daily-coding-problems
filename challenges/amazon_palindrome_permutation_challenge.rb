=begin
This problem was asked by Amazon.
Given a string, determine whether any permutation of it is a palindrome.
For example, carrace should return true, since it can be rearranged to form racecar, which is a palindrome. 
daily should return false, since there's no rearrangement that can form a palindrome
=end

def can_permutate_a_palindrome?(string)
  letters_counts = {}

  string.split('').each do |letter|
    if letters_counts.key?(letter)
      letters_counts[letter] += 1
      next
    end

    letters_counts[letter] = 1
  end

  how_many_letters_are_odd = 0
  letters_counts.values.each do |letter_count|
    if letter_count.odd?
      how_many_letters_are_odd += 1
    end
  end

  can_permutate = how_many_letters_are_odd <= 1 ? "Yes" : "No"
  "String: \"#{string}\" can permutate a palindrome?: #{can_permutate}"
end

puts can_permutate_a_palindrome?('carrace') #racecar
puts can_permutate_a_palindrome?('damam') # madam
puts can_permutate_a_palindrome?('onon') # noon
puts can_permutate_a_palindrome?('elvel') # level
puts can_permutate_a_palindrome?('icvic') # civic
puts can_permutate_a_palindrome?('agsas') # sagas

puts can_permutate_a_palindrome?('daily') # not possible
puts can_permutate_a_palindrome?('naner') # renan (not possible)