```elixir
defmodule Queue do
  defstruct stack1: [], stack2: []

  @doc """
  Returns a new queue.
  """
  def new(), do: %__MODULE__{stack1: [], stack2: []}

  @doc """
  Adds an element to the end of the queue.

  ## Examples

      iex> queue = Queue.new()
      iex> Queue.enqueue(queue, "hello")
      # [{"enqueue", ["hello"]}]
      iex> Queue.dequeue(queue)
      :ok
      iex> Queue.dequeue(queue)
      :ok
  """
  def enqueue(%__MODULE__{stack1: stack1} = queue, element), do: %__MODULE__{
    stack2: [element | stack2],
    stack1: stack1
  }

  @doc """
  Removes the front element from the queue.

  ## Examples

      iex> queue = Queue.new()
      iex> Queue.enqueue(queue, "hello")
      iex> Queue.dequeue(queue)
      # {:ok, "hello"}
      iex> Queue.dequeue(queue)
      :ok
  """
  def dequeue(%__MODULE__{stack2: stack2} = queue), do: case stack2 do
    [] -> :no_element_in_queue
    _ -> %__MODULE__{stack1: [head | tail], stack2: tail}
  end

  @doc """
  Checks if there are elements in the queue.

  ## Examples

      iex> queue = Queue.new()
      iex> Queue.enqueue(queue, "hello")
      # [{"enqueue", ["hello"]}]
      iex> Queue.size(queue)
      # {:ok, 1}
      iex> Queue.dequeue(queue)
      :ok
      iex> Queue.size(queue)
      # {:ok, 0}
  """
  def size(%__MODULE{}), do: length(stack2)

  @doc """
  Checks if there are elements in the queue.

  ## Examples

      iex> queue = Queue.new()
      iex> Queue.enqueue(queue, "hello")
      # [{"enqueue", ["hello"]}]
      iex> !Queue.isEmpty(queue)
      # :true
      iex> Queue.dequeue(queue)
      :ok
      iex> !Queue.isEmpty(queue)
      # :false
  """
  def isEmpty(%__MODULE{}), do: stack2 == []

end
```