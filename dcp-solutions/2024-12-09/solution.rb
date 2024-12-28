```ruby
def random_not_in(l, n)
  while true do
    num = rand(n)
    unless l.include?(num)
      return num
    end
  end
end
```