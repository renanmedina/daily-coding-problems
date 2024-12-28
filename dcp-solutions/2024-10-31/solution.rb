```ruby
class LRUCache {
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @order = []
  end

  def get(key)
    if !@cache.key?(key)
      return nil
    else
      value = @cache[key]
      @order.remove(key)
      @order << key
      return value
    end
  end

  def set(key, value)
    if @cache.key?(key)
      @order.remove(key)
    elsif @capacity == 0
      key = @order.pop
      @cache.delete(key)
    end
    @cache[key] = value
    @order << key
    raise "Cache is full" unless @order.size <= @capacity
  end
}
```