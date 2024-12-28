```ruby
def can_reach_end(hops)
  max_reach = hops[0]
  for i in 1..hops.size - 1 do
    unless hops[i] + i > max_reach
      max_reach = [max_reach, i + hops[i]].max
    end
  end
  max_reach >= hops.size - 1
end
```