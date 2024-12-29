```ruby
class TreeNode;
    attr_accessor :val, :left, :right

end

def path_to_leaves(root);
    result = []

    dfs(root, [], result)
    result
end

def dfs(node, path, result);
    return unless node
    path << node.val
    if !node.left && !node.right;
        result << path.dup
    else;
        dfs(node.left, path, result) if node.left
        dfs(node.right, path, result) if node.right
    end
end
```