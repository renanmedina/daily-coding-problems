### Elixir Solution
```elixir
def second_largest(root) when is_map, do: second_largest(root, nil, nil)
def second_largest(root), do: second_largest(root, nil, nil)

defp second_largest(map, max, min) when map == nil do
  case {max, min} do
    {:nil, :nil} -> [nil, nil]
    {^min, ^min} -> [^min, nil]
    {^min, ^max} -> [^min, ^max]
  end
end

def second_largest(map, max, min) do
  children = map[:children] || []
  [max, min] = Enum.sort([max || :inf, min || :inf])
  children
  |> Enum.flat_map(&second_largest/1)
  |> Enum.map(fn node -> {node.value, node} end)
  |> Enum.filter(&(&1.0 > &2.0))
  |> List.keyfind(:value, 1)
  |> elem(0)
end
```