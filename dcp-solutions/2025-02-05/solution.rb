```ruby
def gray_code(n)
  return [] if n <= 0
  gray = [0]
  (1 << (n - 1)).times do |x|
    gray << x | (1 << (n - 1))
    gray << x ^ (1 << (n - 1))
  end
  gray.sort!
  gray.reverse!
end
```