```ruby
class TreeNode
  attr_accessor :val, :left, :right
end

def min_path_sum(root)
  def dfs(node, path_sum)
    return path_sum if node.left.nil? && node.right.nil?
    left_sum = node.left ? dfs(node.left, path_sum + node.left.val) : nil
    right_sum = node.right ? dfs(node.right, path_sum + node.right.val) : nil
    [left_sum, right_sum].compact.sum || path_sum
  end
  return dfs(root, root.val)
end
```