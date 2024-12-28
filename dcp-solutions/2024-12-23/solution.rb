```ruby
def is_palindrome(head)
  # Store values of nodes to check later
  values = []

  # Traverse forward
  current = head
  until current.nil?
    values << current.val
    current = current.next
  end

  # Compare values
  left = 0
  right = values.size - 1

  while left < right
    return false unless values[left] == values[right]
    left += 1
    right -= 1
  end

  true
end

def is_palindrome_singly(head)
  # Store nodes to check later
  nodes = [head]

  until nodes.empty?
    current = nodes.pop
    next_node = current.next unless current.next.nil?

    return false unless send(current, :val) == send(next_node, :val)

    if next_node.nil? || !nodes.include?(next_node)
      nodes.push(current.next)
    else
      nodes.push(next_node)
    end
  end

  true
end

# Node class definition for doubly linked list
class Node
  attr_accessor :val, :prev, :next

  def initialize(val)
    @val = val
    @prev = nil
    @next = nil
  end
end

# Node class definition for singly linked list
class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end
```