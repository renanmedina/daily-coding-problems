# Good morning! Here's your coding interview problem for today.
# This problem was asked by Squarespace.
# Write a function, add_subtract, which alternately adds and subtracts curried arguments. Here are some sample operations:
# add_subtract(7) -> 7

# add_subtract(1)(2)(3) -> 1 + 2 - 3 -> 0

# add_subtract(-5)(10)(3)(9) -> -5 + 10 - 3 + 9 -> 11
# ________________________________________
defmodule Currying do
  def add_subtract(value) do
    add_subtract(value, 1)
  end

  # multiplier switches between 1 and -1 to make the effect of adding and subtracting from next argument easier xD
  def add_subtract(accumulator, multiplier) do
    fn (next_value) ->
      case is_nil(next_value) do
        true -> accumulator
        _ ->
          accumulator = accumulator + (next_value * multiplier)
          add_subtract(accumulator, (multiplier * -1))
      end
    end
  end
end

## samples
IO.inspect(Currying.add_subtract(7).(nil)) # 7
IO.inspect(Currying.add_subtract(1).(2).(3).(nil)) # 0
IO.inspect(Currying.add_subtract(-5).(10).(3).(9).(nil)) # 11
