```markdown
# Map Implementation in Ruby

class Map
  def initialize
    @key_value_pairs = {}
    @time_index = {}
  end

  # Sets key to value at time t
  def set(key, value, time)
    if @key_value_pairs.key?(key)
      @key_value_pairs[key][1] = [value, time]
      @time_index[[key, @key_value_pairs[key][1]]] = time
    else
      @key_value_pairs[key] = [[value, time]]
      @time_index[[key, [value, time]]] = time
    end
  end

  # Returns the value of key at time t. Returns nil if no such entry exists.
  def get(key, time)
    if @time_index.key?([key, [time, nil]])
      until_value = []
      until_time = time
      until_value << @key_value_pairs[key][-1] while until_time >= until_value.last[1]
      return until_value.last[0] unless until_value.empty?
    end
    return nil
  end
end
```