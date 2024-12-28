```ruby
def break_string_into_lines(s, k):
  words = s.split
  lines = []
  current_line = []
  line_length = 0

  until words.empty?
    word = words.shift
    if line_length + word.length + 1 <= k
      current_line << word
      line_length += word.length + 1
    else
      lines << current_line.join(' ')
      current_line = [word]
      line_length = word.length + 1
    end
  end

  lines << current_line.join(' ') if !current_line.empty?

  return lines unless line_length > k

  null
end
```