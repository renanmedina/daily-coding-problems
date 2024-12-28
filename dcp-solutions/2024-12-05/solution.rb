```ruby
def min_remove_to_make_valid(s)
  s += '#'
  stack = []
  invalid = []

  (0...s.length).each do |i|
    char = s[i]
    if char == '('
      stack << i
    elsif char == ')'
      return invalid.size if stack.empty?
      stack.pop unless stack.last >= i
    else
      invalid << i
    end
  end

  invalid + (stack - [s.length - 1]).map { |i| s[i] }
end
```