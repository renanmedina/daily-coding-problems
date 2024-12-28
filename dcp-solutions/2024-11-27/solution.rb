### Ruby Solution
```markdown
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
end

def merge_k_lists(lists)
  # Create a priority queue to store nodes from the lists
  queue = []
  lists.each_with_index do |list, index|
    return nil if list.nil?
    # Push the node onto the heap with its value and original list index
    queue.push([list.val, list, index])
  end

  # Heapify the queue
  queue.sort_by!(&:first)
  head = tail = ListNode.new(val: queue.first[0], next: nil)

  while queue.any?
    val, node, _ = queue.shift
    if tail.next.nil?
      # This is the first node in the merged list
      tail.next = node
    else
      # Push the next node from the original list onto the heap
      queue.push([node.val, node.next, node.index])
      queue.sort_by!(&:first)
    end

    # If there are more nodes from the same list that have been pushed,
    # pop and push one to maintain heap order
    while !queue.empty? && queue.first[1].val == val
      _, next_node, _ = queue.shift
      if tail.next.nil?
        tail.next = next_node
      else
        queue.push([next_node.val, next_node.next, next_node.index])
        queue.sort_by!(&:first)
      end
    end

    # Update the head of the merged list if necessary
    tail = tail.next
  end

  return head
end
```