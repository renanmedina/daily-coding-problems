```ruby
class Queue
  def initialize
    @stack1 = []
    @stack2 = []
  end

  # Enqueue an element onto the queue
  def enqueue(element)
    @stack1.push(element)
  end

  # Dequeue an element from the queue
  def dequeue
    return if @stack2.empty?

    element = @stack2.pop
    while !@stack1.empty?
      @stack2.push(@stack1.pop)
    end

    element
  end
end
```