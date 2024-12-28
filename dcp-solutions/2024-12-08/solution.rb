```ruby
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def validBST(root)
  return true if root.nil?

  min_val = Float::INFINITY
  max_val = -Float::INFINITY

  def is_valid(node, min_val, max_val)
    return false unless node

    val = node.val

    return val < max_val && val > min_val if [min_val, max_val].include?(val)

    left_valid = is_valid(node.left, min_val, val) && node.val < max_val
    right_valid = is_valid(node.right, val, max_val) && node.val > min_val

    return left_valid || right_valid
  end

  is_valid(root, min_val, max_val)
end
```