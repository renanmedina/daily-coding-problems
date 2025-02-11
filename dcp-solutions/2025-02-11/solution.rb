```ruby
class HeapStack
  def initialize
    @max_heap = []
  end

  # Pushes an item onto the stack.
  #
  # @param [any] item The item to push. If heap is empty, it will be added at root of the heap.
  # @raise [StandardError] If heap already has items in it and you try to push onto a full heap.
  def push(item)
    raise "Heap is not empty" if @max_heap.any?
    @max_heap << item
    heapify_up(@max_heap.size - 1)
  end

  # Pops the top item off of the stack.
  #
  # @return [any] The popped item. If there are no items on the stack, an error is thrown.
  # @raise [StandardError] If heap is empty
  def pop
    raise "Heap is empty" if @max_heap.empty?
    return item = @max_heap[0] if @max_heap.size == 1
    item = @max_heap[0]
    last_item = @max_heap.pop
    @max_heap[0] = last_item
    heapify_down(0)
    item
  end

  private

  # Heapifies the element at index i up towards root using a parent-child comparison.
  #
  # @param [Integer] i Index of the current node in the max heap.
  def heapify_up(index)
    parent_index = (index - 1) / 2
    return if parent_index < 0

    case compare(@max_heap[parent_index], @max_heap[index])
    when :greater, :equal
      return
    else
      @max_heap[parent_index], @max_heap[index] = @max_heap[index], @max_heap[parent_index]
      heapify_up(parent_index)
    end
  end

  # Heapifies the element at index i down towards root using a parent-child comparison.
  #
  # @param [Integer] i Index of the current node in the max heap.
  def heapify_down(index)
    left_child_index = 2 * index + 1
    right_child_index = 2 * index + 2

    smallest = index
    case compare(@max_heap[smallest], @max_heap[left_child_index])
    when :greater
      smallest = left_child_index
    end
    case compare(@max_heap[smallest], @max_heap[right_child_index])
    when :greater
      smallest = right_child_index
    end

    return unless smallest != index

    @max_heap[index], @max_heap[smallest] = @max_heap[smallest], @max_heap[index]
    heapify_down(smallest)
  end

  # Compares two items in the max heap and returns a value based on the result.
  #
  # @param [any] item1 The first item to compare.
  # @param [any] item2 The second item to compare.
  # @return [:less, :greater, :equal]
  def compare(item1, item2)
    if item1 > item2
      :greater
    elsif item1 < item2
      :less
    else
      :equal
    end
  end
end
```