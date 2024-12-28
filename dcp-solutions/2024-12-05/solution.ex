```elixir
defmodule ParenthesesRemover do
  @spec remove_to_make_valid(String.t()) :: non_neg_integer
  def remove_to_make_valid(s) do
    stack = []
    count = 0

    for c in s do
      case c do
       ?(
        when is_integer(n) -> n + 1
      end
    end
  end
end
```