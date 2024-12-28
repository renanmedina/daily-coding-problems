```ruby
def merge_intervals(intervals)
  intervals.sort_by(&:first)
  merged = [intervals.first]
  
  intervals[1..].each do |interval|
    last_merged = merged.last
    merged << [last_merged.first, interval.last] if (last_merged.last >= interval.first)
  end
  
  merged
end
```