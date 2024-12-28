```elixir
defmodule FileSync do
  def get_diff(%{local_files: local_files, remote_files: remote_files} = data) when not is_map(data), do: nil

  def get_diff(data) when is_map(data) do
    common_keys = set_intersection(Map.keys(local_files), Map.keys(remote_files))
    changes = Map.new()
    for key in common_keys do
      diff =
        if Map.get(local_files, key) == Map.get(remote_files, key) do
          nil
        else
          data
          |> get_diff(key)
        end

      case diff do
        nil -> changes
        %{} = changes_in_local => Map.put(changes, key, changes_in_local)
        _ ->
          changes_in_remote =
            if Map.get(remote_files, key) == Map.get(local_files, key), do: nil, else: data
              |> get_diff(key)

          Map.put(changes, key, changes_in_remote)
      end
    end

    Map.put(changes, ~w(added|removed), %{
      added => remote_files,
      removed => local_files
    })
  end

  def set_intersection(list1, list2) when is_list(list1) and is_list(list2) do
    set_intersection(Enum.map(list1, &(&1)), Enum.map(list2, &(&1)))
  end

  def set_intersection([], _), do: []
  def set_intersection([head | tail], [head | tail2]) when not is_nil(tail) and not is_nil(tail2),
    do: [head | set_intersection(tail, tail2)]

  def set_intersection([], _), do: [head | set_intersection(tail, tail2)]
  def set_intersection([_ | tail], _), do: set_intersection(tail, [])
end
```