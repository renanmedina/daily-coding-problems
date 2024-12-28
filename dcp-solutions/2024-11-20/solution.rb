```ruby
def rand5()
  a = rand(7)
  b = rand(7)
  while a == b
    b = rand(7)
  end
  p = (a + b) / 2
  if p % 2 == 0
    return (a + b) / 2
  else
    return p + 1
  end
end
```