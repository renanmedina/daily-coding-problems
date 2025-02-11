```elixir
defmodule HeapStack do
  defstruct heap: []

  @doc """
  Pushes an item onto the stack
  """
  def push(heap) when is_list(heap), do: {:ok, [atom_to_binary(:stack, heap), hd(heap)] | tail(heap)}
  
  def push(heap) when is_map(heap), do: {:ok, Map.put(heap, :stack => [atom_to_binary(:stack, heap), hd(heap)], map_size(heap)+1)}

  @doc """
  Pops the top item off the stack
  """
  def pop(heap) when is_list(heap) do
    case head(heap) do
      nil -> {:error, "Heap is empty"}
      head -> {:ok, tail(heap), :stack}
    end
  end
  
  def pop(heap) when is_map(heap) do
    case Map.get(heap, :stack, []) do
      [] -> {:error, "Heap is empty"}
      _ -> {:ok, pop(map_to_list(head(heap))), map_size(heap)+1}
    end
  end

  @doc """
  Returns the top item on the stack
  """
  def top(heap) when is_map(heap), do: Map.get(heap, :stack, [])
  
  @doc """
  Returns the size of the heap
  """
  def size(heap) when is_list(heap), do: length(heap)
  
  @doc """
  Returns the size of the heap
  """
  def size(heap) when is_map(heap), do: Map.get(heap, :stack, [])
end

defimpl HeapStack, for: :heap do
  def head([]), do: nil
  def head([{item | _}]) do: item
  def head([_ | tail]) do: head(tail)
  def head(%{stack: [^item | _]}) do: ^item
end

defimpl HeapStack, for: :list do
  def head([]), do: nil
  
  def head([hd | _]), do: hd
  
  def head([_ | tail]) do: head(tail)
  
  def map_to_list([item | _]), do: [item]
  
  def map_to_list(_), do: []
end

defimpl HeapStack, for: :map do
  def head(%{stack: [^item | _]}), do: ^item
  
  def head({_| _}), do: nil
  
  def head(%{stack: [^item | tail]}), do: head(tail)
  
  def map_to_list([item | _]), do: [item]
end
```