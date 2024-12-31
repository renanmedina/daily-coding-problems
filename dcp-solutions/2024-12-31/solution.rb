```ruby
class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end
end

def lowest_common_ancestor(root, p, q)
  # find the root of both nodes in tree
  r_p = find(root, p.value, [p])
  r_q = find(root, q.value, [q])

  return null if r_p == r_q

  # if one node is a descendant of another then return the parent of that node
  until r_p == r_q do
    return r_p[0].parent if r_p[1] == r_q
    r_p = find(r_p[0].parent, p.value, [p])
    r_q = find(r_q[0].parent, q.value, [q])
  end

  # the point where both paths meet is the lca
  return r_p[0]
end

def find(root, value, ancestors)
  if root == nil
    return nil
  end

  if root.value == value
    return [root, ancestors]
  else
    result_l = find(root.left, value, ancestors.dup) || find(root.right, value, ancestors.dup)
    return result_l unless result_l.nil?
  end
end
```