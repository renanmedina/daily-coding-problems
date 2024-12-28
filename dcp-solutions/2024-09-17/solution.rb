```ruby
def count_unival_trees(root)
  return 1 if root.nil?
  left_count = count_unival_trees(root.left)
  right_count = count_unival_trees(root.right)
  return left_count + right_count unless root.val == root.left.val && root.val == root.right.val
  return 1 + left_count + right_count
end
```