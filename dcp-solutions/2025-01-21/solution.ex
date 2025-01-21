```elixir
defmodule Solution do
  def inorder_successor(node) when is_map and node !== nil, do: next_bigger(node)
  
  defp next_bigger({left, right}) do
    if left == nil, do: find_next_bigger(right)
    else
      lower = elem(find_lower(left), 1)
      {lower, right}
    end
  end

  defp next_bigger({left, _}) when is_map, do: find_next_bigger(left)

  defp next_bigger(right) when is_map and right !== nil, do: find_greater(right)

  defp find_lower(map) when map !== nil do
    {lower, upper} = find_pair(map)
    lower
  end

  defp find_lower(nil), do: nil

  defp find_pair({left, right}) when is_map and left !== nil do
    case elem(left, :left) do
      nil -> {right, right}
      val -> {val, right}
    end
  end

  defp find_pair({left, right}), do: {find_lower(left), find_greater(right)}

  defp find_greater(node) when is_map and node !== nil, do: elem(node, :right)

  defp find_greater(nil), do: nil
end
```