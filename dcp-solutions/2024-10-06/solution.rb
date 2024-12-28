```ruby
def is_valid(s)
  stack = []
  pairs = { ')' => '(', '}' => '{', '>' => '<', '?' => '?' }

  s.each_char do |char|
    if pairs.key?(char)
      stack << char unless stack.empty? && stack.last == pairs[char]
    elsif !stack.empty?
      break unless stack.pop != pairs[char]
    end
  end

  return stack.empty?
end
```