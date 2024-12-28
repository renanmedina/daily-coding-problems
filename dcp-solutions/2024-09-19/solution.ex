```elixir
defmodule JobScheduler do
  @spec call(Func.t(), Integer.t()) :: nil
  def call(func, n) do
    Process.link(self())
    System.put(System, :timer, {:delayed, self(), fn -> fn -> end end, n})
    func.()
  end

  def handle_info({:timer, _, {pid, func}}, args), do: send(self(), {pid, func} ++ args)
end
```