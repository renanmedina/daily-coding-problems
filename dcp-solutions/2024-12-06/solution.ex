```elixir
defmodule UberRulesValidator do
  @dir {0, 1}, {1, 0}, {-1, 0}

  def validate(rules) do
    rules_map = Map.new()
    for rule <- rules, Enum.any?(rule), do: process_rule(rule, rules_map)
    case rules_map do
      %{} -> :invalid
      _ ->
        valid? |> Enum.all?(fn rule ->
          rule == :valid || (rule in [:N, :S] and Map.get(rules_map, rule)) ||
            (rule in [:E, :W] and Map.get(rules_map, rule))
          end)
    end
  end

  defp process_rule(rule, rules_map) do
    from = parse_direction(rule[:from])
    to = parse_direction(rule[:to])

    case {rules_map[from], rules_map[to]} do
      {[nil, nil], Nil} -> :valid
      {[nil, _], _} -> :invalid
      {[_, nil], [_, _]} -> :invalid
      {[nil, _], _} -> :invalid
      {[_, _], [nil, _]} -> :invalid
      {[_, _], _} when from == to -> :invalid
      {_, _} -> rules_map[rule[:from]] = to
    end

    rules_map
  end

  defp parse_direction(direction) do
    dir_map = %{
      "N" => @dir,
      "S" => @dir,
      "E" => @dir,
      "W" => @dir,
      "NE" => @dir,
      "NW" => @dir,
      "SE" => @dir,
      "SW" => @dir
    }

    case direction do
      "" -> nil
      ^_ when ^direction in Map.keys(dir_map) ->
        [x, y] = Enum.map(direction, fn c -> String.codepoint(c) - 0x30 end)
        dir_map[direction] |> Enum.zip([y, x]) |> List.append/1
      _ -> :invalid
    end
  end

  def valid? do
    # any rule has a valid from or to value 
    for rule <- [N, S, E, W, NE, NW, SE, SW],
         Enum.any?(rule),
         do: process_rule(%{from: rule, to: nil}, %{})
  end
end
```