```ruby
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def largest_bst(root)
  return -1 if root.nil?
  max_size = [-Float::INFINITY]
  dfs(root, max_size)
  return max_size[0] * 2 - 1
rescue StandardError => e
  raise "Error: #{e.message}"
end

def dfs(node, max_size)
  return true if node.nil?

  left_ok = dfs(node.left, max_size)
  right_ok = dfs(node.right, max_size)

  return false if (node.val <= node.left.val || node.val >= node.right.val) && !left_ok && !right_ok
  return false if left_ok && !right_ok

  size = 1 + dfs(node.left, max_size)[0] + dfs(node.right, max_size)[0]
  max_size[0] = [max_size[0], size].max
  true
end
```