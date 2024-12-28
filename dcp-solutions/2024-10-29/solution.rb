```ruby
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def evaluate_tree(root)
  return root.val if root.left.nil? && root.right.nil?

  left_result = evaluate_tree(root.left)
  right_result = evaluate_tree(root.right)

  case root.val
  when '+', '*'
    left_result + right_result
  when '-'
    left_result - right_result
  when '/'
    left_result.to_f / right_result
  end
end
```