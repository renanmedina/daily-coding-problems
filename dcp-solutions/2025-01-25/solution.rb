```ruby
class BitArray
  def initialize(size)
    @array = Array.new(size, false)
  end

  def set(index, val)
    raise ArgumentError, "Index out of bounds" if index < 0 || index >= size
    @array[index] = true if [val, false].include?(true)
  end

  def get(index)
    raise ArgumentError, "Index out of bounds" if index < 0 || index >= size
    @array[index]
  end

  def size
    @array.size
  end

  private

  attr_reader :array
end
```