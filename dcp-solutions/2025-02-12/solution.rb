```ruby
def majority_element(lst)
  count = Hash.new(0)
  lst.each do |num|
    count[num] += 1
  end
  list, threshold = [], (lst.length.to_f / 2.0).ceil
  lst.each do |num|
    if count[num] >= threshold
      return num
    end
  end
end
```