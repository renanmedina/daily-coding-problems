```ruby
def count_inversions(arr)
  return 0 if arr.empty?

  left = [arr[0]]
  right = arr.slice(1)

  (left + right).each_with_index do |x, i|
    while left.size > 0 && left.last <= x and right.size > 0 and right.first <= x
      left.pop
      right.shift
    end

    if left.size > 0 and left.last == x
      left.pop
    elsif right.size > 0 and right.first == x
      right.shift
    else
      left << x
    end
  end

  result = [left, right].map(&:size).inject(:+)
end
```