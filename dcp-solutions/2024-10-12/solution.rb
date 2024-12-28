```ruby
class MedianTracker {
  def initialize()
    @min_heap = []
    @max_heap = []
  end

  def add_num(num)
    # Push number to appropriate heap
    if @min_heap.empty? || num <= @min_heap.top
      push_to_min_heap(num)
    else
      push_to_max_heap(num)
    end
    
    # Balance heaps and print median
    balance_heaps
    print_median
  end

private
  def push_to_min_heap(num)
    @min_heap.push(num)
    heapify_up
  end

  def push_to_max_heap(num)
    @max_heap.unshift(num)
    heapify_down
  end

  def balance_heaps
    return if @min_heap.size == @max_heap.size
    
    if @min_heap.size > @max_heap.size
      # Move largest element from min_heap to max_heap
      max_num = @min_heap.pop
      push_to_max_heap(max_num)
    elsif @max_heap.size > @min_heap.size + 1
      # Move smallest element from max_heap to min_heap
      min_num = @max_heap.shift
      push_to_min_heap(min_num)
    end
  end

  def heapify_up
    index = @min_heap.size - 1
    parent_index = (index - 1) / 2
    
    while index > 0 && @min_heap[parent_index] > @min_heap[index]
      @min_heap[parent_index], @min_heap[index] = [@min_heap[index], @min_heap[parent_index]]
      index = parent_index
      parent_index = (index - 1) / 2
    end
  end

  def heapify_down
    index = @max_heap.size - 1
    child_index = 2 * index + 1
    
    while child_index < @max_heap.size
      max_child_index = child_index
      if child_index + 1 < @max_heap.size && @max_heap[child_index + 1] > @max_heap[max_child_index]
        max_child_index += 1
      end
      
      if @max_heap[index] >= @max_heap[max_child_index]
        break
      end
      
      @max_heap[index], @max_heap[max_child_index] = [@max_heap[max_child_index], @max_heap[index]]
      index = max_child_index
      child_index = 2 * index + 1
    end
  end

  def print_median
    if @min_heap.size == @max_heap.size
      median = (@min_heap.top + @max_heap.shift) / 2.0
      puts median
    else
      median = @min_heap.top
      puts median
    end
  end
}
```