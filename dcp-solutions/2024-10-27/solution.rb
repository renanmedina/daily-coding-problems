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

def build_tree(preorder, inorder)
    if preorder.empty?
        return nil
    end
    
    root_val = preorder.shift
    root_idx = find(root_val, inorder)
    
    root = TreeNode.new(root_val)
    root.left = build_tree(preorder, inorder.drop(root_idx..))
    root.right = build_tree(preorder, inorder.take(0...root_idx))
    
    return root
end

def find(val, inorder)
    idx = 0
    while inorder[idx] != val
        idx += 1
    end
    return idx
end
```