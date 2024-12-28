```elixir
defmodule MaxStack do
  defstruct stack: [], max_stack: []

  @spec push(Any) :: :ok
  def push(val), do: {:ok, %{stack: [val | stack], max_stack: max_stack([val])}}

  @spec pop() :: Any | nil
  def pop() do
    case Enum.at(stack, -1) do
      nil -> :error
      nil -> nil
      val when val in max_stack do
        {:ok, %{stack: [], max_stack: []}}
      else
        {:ok, %{stack: stack, max_stack: [val | max_stack]}}
      end
    end
  end

  @spec max() :: Any | nil
  def max(), do: max_stack()
end

defmodule MaxStack.MaxStack do
  @spec find_max(list) :: non_neg_integer | nil
  def find_max([]), do: nil

  @spec find_max([non_neg_integer]) :: non_neg_integer | nil
  def find_max([^max, tail]), do: max

  defp find_max([val | tail]), do: val > max ? val : max end

  defp find_max([^_, tail]), do: find_max(tail)
end
```