```ruby
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def isSubtree(s, t)
  return true if s == nil
  return false if t == nil

  return isMatch(s, t) ? true : false
end

def isMatch(t1, t2)
  return false unless t1 && t2
  return t1.val == t2.val &&
         (isMatch(t1.left,  t2.left) || isMatch(t1.right, t2.right))
end
```