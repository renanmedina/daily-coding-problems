```elixir
defmodule Map do
  @type t :: %__MODULE__{}

  defstruct times: %{}

  @doc false
  def new()::t
  def new() do
    %__MODULE__{times: %{}}
  end

  @doc """
  Sets the key to value at time.
  """
  def set(key, value, time), do: update(time: time, get: fn -> nil end, set: &set/3)

  @doc """
  Gets the key at given time.

  If no value is set for that key at that time, returns `nil`.
  Otherwise, returns the most recent value set for that key.
  """
  def get(key, time), do: update(time: time, get: fn -> nil end, get: &get/2)

  defp update(%{times: times} = map, time, get, set \\&set/3) when is_integer(time) do
    case Map.get(times, time) do
      nil ->
        Map.put(map, :times, Map.put(times, time, {key, value}))
        set.(value)

      {:ok, value} ->
        Map.put(map, :times, map)
        get.(value)

      {:error, reason} -> raise(reason)
    end
  end

  defp update(%{times: times} = map, time, get, set \\&set/3) when is_binary(time) do
    case binary_to_integer(time) do
      nil ->
          map

      time ->
        Map.update(map, time, &update/5)
    end
  end
end
```