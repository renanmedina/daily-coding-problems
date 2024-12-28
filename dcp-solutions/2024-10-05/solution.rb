```ruby
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def remove_nth_from_end(head, n)
  dummy_node = ListNode.new(-n)
  dummy_node.next = head
  current_node = dummy_node
  
  (1..(head.val)) do |i|
    return if i == n
    current_node.next = current_node.next.next
  end

  current_node.next
end
```