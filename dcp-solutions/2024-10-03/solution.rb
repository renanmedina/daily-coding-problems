```ruby
class TreeNode
  attr_accessor :val, :left, :right, :parent, :locked

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
    @parent = nil
    @locked = false
  end

  def is_locked
    return @locked
  end

  def lock
    return false if @locked || (@left && !@left.locked) || (@right && !@right.locked)
    @locked = true
    return true
  end

  def unlock
    return false if not(@locked || (@left && !@left.locked) || (@right && !@right.locked))
    @locked = false
    return true
  end
end
```