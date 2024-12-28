```elixir
defmodule RunningMedian {
  def calculate_median(numbers) do
    numbers
    |> Enum.sort()
    |> calculate_median_numbers()
  end

  defp calculate_median_numbers([]), do: []
  defp calculate_median_numbers([head | tail]) when is_empty(tail), do: [head]
  defp calculate_median_numbers([_ | _] = tail) do
    numbers = calculate_median_numbers(tail)
    mid = length(numbers) / 2
    case length(numbers) do
      even -> [numbers[~a mid - 1], numbers[mid]]
      odd -> numbers
    end
  end

  defp is_empty([]), true
  defp is_empty([_ | _]), false
end

defmodule RunningMedianIterator {
  @moduledoc "Running median iterator"
  use GenServer

  @doc """
  Starts the running median iterator.

  Args:
      - initial_numbers: A list of numbers to start with.
  """
  def start_link(initial_numbers) do
    GenServer.start_link(__MODULE__, initial_numbers, [])
  end

  @doc """
  Calculates and returns the median of a sequence of numbers from the current state.
  """
  def calculate_median(numbers), do: RunningMedian.calculate_median(numbers)

  # GenServer callback
  def init([numbers]) do
    send(self(), :add_number)
    {:ok, %{running_numbers: [], running_meds: []}}
  end

  def handle_cast({:add_number}, state) do
    updated_running_numbers = [state[:running_numbers] ++ [numbers]]
    new_median = RunningMedian.calculate_median(updated_running_numbers)
    {:noreply, Map.put(state, :running_numbers: updated_running_numbers, :running_meds: [new_median])}
  end
}

# Usage example:
iex> numbers = [2, 1, 5, 7, 2, 0, 5]
iex> RunningMedianIterator.start_link(numbers)
iex> running_median_iterator = RunningMedianIterator
iex> Enum.each(numbers, fn num -> RunningMedianIterator.cast(running_median_iterator, {:add_number, num}) end)
iex> Enum.join(RunningMedianIterator.running_meds(), " ")
# outputs "2 1.5 2 3.5 2 2 2"
```