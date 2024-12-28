```ruby
def swap_bits(n)
  n ^ ((n >> 1) & 0x99) & 0xFF
end
```