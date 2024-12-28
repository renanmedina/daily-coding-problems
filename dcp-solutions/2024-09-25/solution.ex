```markdown
# Solution

## Ordered Set Data Structure

We will utilize an ordered set data structure to efficiently keep track of the last N order IDs.

### Implementation

```elixir
defmodule OrderLog do
  defstruct []

  @type t() :: %__MODULE__{}

  defstruct(log: [])

  def record(order_id) do
    new_log = [order_id | log]
    %{log: new_log}
  end

  def get_last(i, %{log: ^log}) when i == length(log), do: nil
  def get_last(i, %{log: ^log} = struct) when i < length(log), do: Enum.at(log, i)
  def get_last(_, %{log: []}), do: nil

  def get_last(_i, _struct) do
    raise ArgumentError, "Order index out of range"
  end
end
```