```ruby
def switch_x_y(x, y, b):
  return x if b == 1
  return y & 0xffffffff if b == 0
end
```