```ruby
def myPow(x, y)
  if x == 0
    return 0
  end

  result = 1
  while y > 0 do
    if y % 2 == 1
      result *= x
    end
    x *= x
    y /= 2
  end

  result
end
```