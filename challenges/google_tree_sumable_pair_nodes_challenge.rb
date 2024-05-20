=begin
Good morning! Here's your coding interview problem for today.
This problem was asked by Google.
Given the root of a binary search tree, and a target K, return two nodes in the tree whose sum equals K.
For example, given the following tree and K of 20
    10
   /   \
 5      15
       /  \
     11    15
Return the nodes 5 and 15.
=end
require 'set'

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

  def find_summable_pair_to_target(target:)
    visited = Set.new

    dfs = -> (node, sum_target){
      return if node.nil? || node.node_value > target

      diff = sum_target - node.node_value

      return [diff, node.node_value] if visited.include?(diff)

      visited << node.node_value
      return nil if node.no_children?

      dfs.call(node.node_left, target) if node.node_left
      dfs.call(node.node_right, target) if node.node_right
    }

    dfs.call(self, target)
  end
end

sample_tree = TreeNode.new(10)
sample_tree.node_left = TreeNode.new(5)
sample_tree.node_right = TreeNode.new(15)
sample_tree.node_right.node_left = TreeNode.new(11)
sample_tree.node_right.node_right = TreeNode.new(15)

target_sum = 25
pairs = sample_tree.find_summable_pair_to_target(target: target_sum)
answer = pairs.nil? ? 'Not found' : "[#{pairs.join(',')}]"
puts "Nodes that sum up to #{target_sum} are: #{answer}"