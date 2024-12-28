```ruby
class RecentOrderLog {
  def initialize(n)
    @n = n
    @log = []
  end

  def record(order_id)
    if @log.size >= @n
      @log.shift
    end
    @log << order_id
  end

  def get_last(i)
    return @log[-(i+1)] if i < @log.size
    nil
  end
}
```