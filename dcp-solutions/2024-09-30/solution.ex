```elixir
defmodule RoomAllocator do
  @spec find_minimum_number_of_rooms(list(tuple)) :: integer
  def find_minimum_number_of_rooms(intervals) when is_list(intervals) do
    # Sort the intervals by start time
    sorted_intervals = Enum.sort_by(intervals, &(&1[0]))

    # Initialize a priority queue to store the end times of the rooms
    room_end_times = [Enum.get(sorted_intervals, 0, {:nil, nil})]

    # Iterate over each interval
    for {start, end} <- sorted_intervals do
      # Remove any rooms that have ended from the priority queue
      new_room_end_times = Enum.filter(room_end_times, fn {{end1, _}, _} -> end1 < start end)

      # Add this room to the priority queue
      new_room_end_times = [start | new_room_end_times]

      # Update the rooms with the latest end time
      room_end_times = new_room_end_times

      # Update the minimum number of rooms required
    end
  end

  def find_minimum_number_of_rooms([]), do: 0

  @doc false
  def get_min_rooms() do
    [[30, 75], [0, 50], [60, 150]] |>
    fn intervals ->
      Enum.map(intervals, fn {start, end} -> start end) end |> Enum.uniq() |> Kernel.at(1)
    end end
  end

end
```