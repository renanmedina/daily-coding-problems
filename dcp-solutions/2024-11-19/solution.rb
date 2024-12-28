```ruby
def nth_perfect_number(n)
  (n..1000000).map { |num| num.to_s.sum } .sort!.take n - 1
end
```