```elixir
defmodule UrlShortener do
  use Map
  use GenServer

  def start_link(url) do
    GenServer.start_link(__MODULE__, url, [])
  end

  defp generate_token do
    # Generate a random six-character alphanumeric token
    Enum.reduce(0..255, "", fn x ->
      if x < 36 do
        char = {:digit, x} |> elem(1) |> to_string()
      else
        char = {:alpha, (x - 10) % 26 + 65} |> elem(1) |> to_string()
      end

      "#{char}"
    end) |> String.t()
  end

  def shorten(url) do
    case get(__MODULE__, url) do
      nil -> put(__MODULE__, url, generate_token())
      value -> IO.puts(value)
    end

    get(__MODULE__, url)
  end

  def restore(short) do
    case get(__MODULE__, short) do
      nil -> :null
      ^short -> head(__MODULE__)
    end
  end

  defp head(map) do
    Map.get(map, "map", nil)
  end

  def init(url) do
    map = %{url: url}
    {:ok, map}
  end
end
```