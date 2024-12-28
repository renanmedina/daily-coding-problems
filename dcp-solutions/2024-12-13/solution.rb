```ruby
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
end

def max_path_sum(root)
  def dfs(node)
    return -Infinity if not node
    left_max = -Infinity
    right_max = -Infinity
    if node.left
      left_max = [node.val + dfs(node.left) , left_max].max
    end
    if node.right
      right_max = [node.val + dfs(node.right), right_max].max
    end
    return [node.val + (left_max > 0 ? left_max : 0) + (right_max > 0 ? right_max : 0), -Infinity].max
  end

  return dfs(root)
end
```