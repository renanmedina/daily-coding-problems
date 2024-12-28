```ruby
def letterCombinations(digits, mapping = {0 => ['a', 'b', 'c']})
  return [] if digits.empty?

  result = []
  current = ''

  def backtrack(combination)
    unless digits.empty?
      current += combination
      for letter in mapping[digits.first]
        result << letter + combination[1..-1] unless combination == ''
        backtrack(letter)
      end
      current.pop
    else
      result << current
    end
  end

  backtrack('')
  return result
end
```