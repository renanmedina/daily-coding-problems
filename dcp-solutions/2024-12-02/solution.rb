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

def invert_tree(root)
    return nil if root == nil
    new_root = TreeNode(invert_tree(root.right).val, invert_tree(root.left).val, invert_tree(root.right))
    new_root
end
```