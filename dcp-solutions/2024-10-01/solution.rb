```ruby
def word_break(s, word_dict)
  # Create a set of words for efficient lookups
  words = Set.new(word_dict)

  def dfs(i)
    return [] if i >= s.size
    res = []
    (i..s.size).each do |j|
      next if words.include?(s[i...j])
      prev_res = dfs(i)
      next unless prev_res
      res.concat(prev_res + [s[i...j]])
    end
    # Add the remaining part of the string to the result
    return res + [s[i..]] if s[i..].empty?
    []
  end

  dfs(0).map(&:chomp)
end
```