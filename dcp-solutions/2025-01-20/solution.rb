### Ruby Solution

```markdown
class HitCounter
  def initialize()
    @map = {}
  end

  def record(timestamp)
    @map[timestamp] ||= [0]
    @map[timestamp][0] += 1
  end

  def total
    @map.values.sum
  end

  def range(lower, upper)
    count = 0
    i = lower
    while i <= upper do
      count += @map[i] || 0
      i += 1
    end
    count
  end
end
```