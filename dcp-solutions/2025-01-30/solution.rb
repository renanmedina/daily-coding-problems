```ruby
def check_balance(s)
  stack = []
  mapping = { '?' => '' }

  def get_mapping(c)
    mapping[c] || c
  end

  s.each_char do |c|
    if c == '('
      stack << c
    elsif c == ')'
      return false unless stack.empty? || get_mapping(stack.pop) == '('
    elsif c == '*'
      stack << get_mapping(c)
    end
  end

  stack.empty?
end
```