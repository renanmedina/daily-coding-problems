```ruby
def inorder_successor(root, parent)
  if root.nil?
    nil
  elsif root.right && (root.left ? root.left.val <= root.val : true) 
    parent[root.right.val]
  else
    loop do
      root = root.left unless root.nil?
      return parent[root.val] if not root.nil?
    end
  end
end

# helper function to perform inorder traversal and update parent of every node in left subtree
def traverse_and_update(root, parent)
  return unless root

  parent[root.val] = traverse_and_update(root.left, parent)

  root.right &&= (root.left ? root.left.val <= root.val : true) ? traverse_and_update(root.right, parent) : nil
end

# function to find inorder successor
def inorder_successor_helper(root)
  return unless root

  parent = Hash.new(false)
  traverse_and_update(root, parent)

  inorder_successor(root, parent[root.val])
end
```