```elixir
defmodule Solution do
  def divide(dividend, divisor) when divisor == 0, do: raise "Cannot divide by zero"
  def divide(dividend, 0), do: raise "Division is undefined for non-positive numbers"
  def divide(dividend, divisor) do
    if dividend < divisor,
      do: -1 * Integer.div(dividend + divisor, divisor)
    else
      quotient = Integer.div(dividend, divisor)
      if remainder = div(dividend, divisor), do: 1 + quotient * (remainder // divisor) end
    end
  end
end
```