```ruby
class Map
  def initialize
    @data = {}
  end

  def set(key, value, time)
    if key.is_a?(String) && value.is_a?(Integer) && time.is_a?(Integer)
      max_time = (@data[key] || 0).to_i
      @data[key] = [value, time]
      unless max_time <= time
        remove_max_key()
      end
    else
      raise ArgumentError, "Invalid arguments"
    end
  end

  def get(key, time)
    return @data[key][0] if @data[key]
    nil
  end

  private

  def remove_max_key
    max_key = @data.keys.map { |k| k.to_i }.max
    key, value, old_time = @data.delete_at(max_key)
    unless value == @data[key][0]
      @data[key] = [value, old_time]
    end
  end
end
```