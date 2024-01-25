=begin
This problem was asked by Facebook.
Given a binary tree, return all paths from the root to leaves.
For example, given the tree:
   1
  / \
 2   3
    / \
   4   5
Return [[1, 2], [1, 3, 4], [1, 3, 5]].
=end

class TreeNode
  attr_accessor :node_value, :node_left, :node_right

  def initialize(node_value)
    @node_value = node_value
    @node_left = nil
    @node_right = nil
  end

  def no_children?
    @node_left.nil? && @node_right.nil?
  end

  def all_paths_to_leaves
    paths = []
    subpath = []

    dfs = -> (node, current_subpath, all_paths) {
      return if node.nil?

      current_subpath.push(node.node_value)

      if node.no_children?
        all_paths.push(current_subpath.dup)
      else
        dfs.call(node.node_left, current_subpath, all_paths) if node.node_left
        dfs.call(node.node_right, current_subpath, all_paths) if node.node_right
      end

      current_subpath.pop
    }

    dfs.call(self, subpath, paths)
    paths
  end
end

sample_tree = TreeNode.new(1)
sample_tree.node_left = TreeNode.new(2)
sample_tree.node_right = TreeNode.new(3)
sample_tree.node_right.node_left = TreeNode.new(4)
sample_tree.node_right.node_right = TreeNode.new(5)

result = sample_tree.all_paths_to_leaves
puts result.inspect