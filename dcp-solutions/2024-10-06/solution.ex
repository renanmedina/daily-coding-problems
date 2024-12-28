```elixir
defmodule BracketBalance do
  @directions %{
    "(" => :open,
    ")" => :close,
    "[" => :left,
    "]" => :right,
    "=" => :eq
  }

  def balance(s) when is_binary(s) do
    stack = []
    for char <- s, into: stack do
      case @directions[char] do
        :open -> nil
        :close ->
          if length(stack) == 0 || @directions[stack[-1]] != :close, do: true, nil
          nil
        :eq ->
          if length(stack) > 0 && @directions[stack[-1]] == :open, do: true, nil
          false
      end
    end

    case stack do
      [] -> true
      _ -> false
    end
  end
end
```