```elixir
defmodule SubarraySum do
  @doc """
  Given a list of integers and a number K, returns which contiguous elements of the list sum to K.
  
  Args:
    lst (list): A list of integers.
    k (integer): The target sum.

  Returns:
    list: A list of starting indices of subarrays that sum up to K.
  """
  def find_subarrays(lst, k) do
    # Create a map to store prefix sums and their indices
    prefix_sums = %{0 => -1}

    # Initialize current sum and result list
    current_sum = 0
    result = []

    for i in 0..length(lst) do
      # Update current sum by adding the next element
      current_sum += lst[i]

      # Check if we've found a subarray that sums up to K
      if Map.get(prefix_sums, current_sum - k) != nil,
        # If so, add the starting index of the previous subarray to result
        Enum.append(result, [Map.get(prefix_sums, current_sum - k) + 1 | prefix_sums[current_sum - k]])
      end

      # Store the updated prefix sum and its index
      if Map.get(prefix_sums, current_sum) == nil,
        Map.put(prefix_sums, current_sum, i)
      else
        Map.update!(prefix_sums, current_sum, &(&1 + 1))
      end
    end

    # Return the list of starting indices of subarrays that sum up to K
    result
  end
end
```