```elixir
defmodule ShortestSubstring do
  @doc """
  Returns the shortest substring of `s` containing all characters in `chars`.

  Args:
    s (String.t): The string to search.
    chars (Set.t): A set of characters.

  Returns:
    String.t: The shortest substring or nil if no such substring exists.
  """
  def find_shortest_substring(s, chars) do
    # If the set of characters is empty, return an empty string
    if Enum.empty?(chars), do: ""

    # Create a map to store the frequency of each character in `chars`
    char_freq = Map.new()
    for char <- chars do
      char_freq[char] = 0
    end

    # Initialize variables to keep track of the minimum substring
    min_len = Float.inf
    min_substring = nil

    # Initialize variables to keep track of the current window
    left = 0
    current_chars = %{}

    # Iterate over each character in `s`
    for right in 1..length(s) do
      char = String.slice(s, right - 1)

      # If the character is in `chars` and it's not already in the window
      if Map.get(char_freq, char) > 0 && !(Map.get(current_chars, char)) do
        # Increment its frequency
        char_freq[char] = char_freq[char] + 1

        # Add it to the window
        current_chars[char] = true
      end

      # If all characters in `chars` are in the window
      if Enum.all?(for <<char, _ >> <- Map.keys(char_freq), into: &(Map.get(&1, char) > 0)), do: true, else
        # Move the left pointer to the right
        left = left + 1

        # Decrement the frequencies of characters going out of the window
        for char <- current_chars do
          case Map.get(char_freq, char) do
            0 -> Map.delete(char_freq, char)
            _ when Map.get(char_freq, char) > 1 -> Map.put(char_freq, char, Map.get(char_freq, char) - 1)
          end
        end

        # Update the minimum substring if necessary
        length = right - left + 1
        if length < min_len do
          min_len = length
          min_substring = String.slice(s, left, right)
        end
      end
    end

    # If a valid substring was found, return it; otherwise, return nil
    case min_substring do
      nil -> nil
      _ when min_len == Float.inf -> nil
      ^min_substring
    end
  end
end
```