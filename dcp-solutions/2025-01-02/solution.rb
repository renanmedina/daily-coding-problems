```ruby
def reverse_words_and_delimiters(s, delimiters):
  delimiter_set = Set.new(delimiters)
  words = s.split(/(#{delimiter_set.to_s})/)
  reversed_words = words.reverse[1..-1].map { |word| word.replace(*delimiters) }
  return delimiter_set.reduce(reversed_words, :+).join
```