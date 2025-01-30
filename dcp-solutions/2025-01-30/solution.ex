```elixir
defmodule Solution do
  @spec balance(String.t()) :: boolean
  def balance(s) do
    stack = []
    index = 0

    for char ->
      when char == "(" do
        if length(stack) > 0, do: push(stack, char)
        else, StackPush.new(stack, char)
      when char == ")" do
        case StackPop.get(stack), do: false, :no_stack, true
        when is_nil(_) -> false
        else, balance(s[index + 1..^s]) end
      when char == "*" do
        balance(s[index + 1..^s])
      end

    end

    length(stack) == 0
  end

  defp StackPush([head | _], char), do: [char | head]
  defp StackPush([], char), do: [char]
  defp StackPop(nil), do: :no_stack
  defp StackPop([^_ | tail]), do: List.pop(tail)
end
```