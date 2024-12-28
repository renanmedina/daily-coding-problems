```ruby
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def second_largest_node(root)
  max = -Float::INFINITY
  max2 = -Float::INFINITY
  traverse(root) do |node|
    return node.val if node.val > max
    (max2 = node.val) and break if node.val > max2 && node.val != max
    max = node.val
  end
  max2 == -Float::INFINITY ? nil : max2
end

def traverse(node, &block)
  return unless block_given?
  block.call(node) if node
  traverse(node.left, &block) if node
  traverse(node.right, &block)
end
```