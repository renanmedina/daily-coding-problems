```elixir
defmodule LFUCache do
  defstruct cache: [], count: %, min_count: nil, index_map: %{}

  @spec new(integer) :: map
  def new(n), do: %__MODULE__{cache: [], count: %{}, min_count: nil, index_map: %{}}

  @doc """
  Set key to value.
  If there are already n items in the cache and we are adding a new item,
  then it should also remove the least frequently used item. If there is a tie,
  then the least recently used key should be removed.

  ## Example

      iex> cache = LFUCache.new(2)
      iex> LFUCache.set(cache, 1, 3)
      iex> LFUCache.set(cache, 2, 5)
      iex> LFUCache.get(cache, 1)
      3
      iex> LFUCache.get(cache, 2)
      5

  """
  def set(cache, key, value) do
    %__MODULE__{cache: ^cache} |>update(key, value)
  end

  @doc """
  Get the value at key.
  If no such key exists, return null.

  ## Example

      iex> cache = LFUCache.new(2)
      iex> LFUCache.set(cache, 1, 3)
      iex> LFUCache.get(cache, 1)
      3
      iex> LFUCache.get(cache, 2)
      :error
  """
  def get(cache, key) do
    %__MODULE__{cache: ^cache} |>fetch(key)
  end

  defp update(%__MODULE__{cache: cache}, key, value) do
    case %{} of
      nil -> %{min_count: nil}
      _ when length(cache) == 0 ->
        %__MODULE__{min_count: :error}

      min_count ->
        if Map.get(min_count[:count], key) == 1 do
          %{
            min_count: Map.put(min_count, :count, 0),
            index_map: Map.delete(min_count, :index)
          }
        else
          %__MODULE__{min_count: Map.update_with(min_count, fn({key, _}) -> nil end)}
        end

      _ ->
        new_index = min_count[:index] + 1
        %{
          cache:
            [key, value | List.delete(cache, key)],
          count:
            Map.put(min_count, key, value),
          index_map: %{key => new_index}
        }
    end |>update(key, value)
  end

  defp update(%__MODULE__{min_count: min_count}, key, value), do: %{min_count: min_count}

  defp update(%__MODULE__{count: count, cache: cache}, key, value) do
    new_cache = [key, value | List.delete(cache, key)]
    new_count =
      %{} of
        ^key ->
          Map.put(new_count, key, value),
        _ ->
          nil

      |> Enum.map(fn({k, v}) -> {k, v} end)

    %{
      cache: new_cache,
      count: new_count,
      min_count:
        if new_count == :error do
          :error
        else
          Map.find(new_count, :count)
        end
    }
  end

  defp update(%__MODULE__{min_count: nil}, _, _), do: %__

  defp fetch(%__MODULE__{cache: cache}, key) when is_integer(key) and (key in cache) do
    value = List:nth(1, Enum.find_index(cache, fn x -> x == key end))
    %{count: count, index_map: index_map}
    = Map.get(count, key)
    %{
      cache: [value | List.delete(cache, key)],
      count: Map.put(count, key, :error),
      min_count:
        if count == :error do
          :error
        else
          Map.find(count, :count)
        end,
      index_map: Map.get(index_map, key) + 1
    }
  rescue
    _ ->
      nil
  end

  defp fetch(%__MODULE__{}, _), do: :error
end
```