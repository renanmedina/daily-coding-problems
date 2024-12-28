```elixir
def longest_consecutive(nums) do
  %{
    "start" => nil,
    "length" => 0
  } 
  |> MapUpdate.new(nums, fn x -> x end)
  |> MapUpdate.new(fn x ->
      # mark all elements as not being part of a sequence
      Enum.each(x, fn y -> 
        if y - 1 in x do
          x = Map.delete(x, y)
        else
          start_y = y
          while true do
            if start_y - 1 in x do
              x = Map.put(x, start_y - 1, nil)
              start_y = start_y - 1
            else
              break
            end
          end
          length = start_y - (start_y - 1) + 1
          x = Map.put(x, start_y, length)
        end
      end
    end)
  |> Map.get("length")
end
```