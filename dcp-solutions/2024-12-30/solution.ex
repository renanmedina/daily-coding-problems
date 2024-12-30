```elixir
defmodule Solution do
  @doc """
  Finds all starting indices in S which are anagrams of W.

  Args:
    w (String.t): The word to find anagrams of.
    s (String.t): The string to search for anagrams in.

  Returns:
    list(integer): A list of starting indices in S which are anagrams of W.

  """
  @spec find_anagrams(String.t, String.t) :: [i32]
  def find_anagrams(w, s) do
    # Convert the word to a character count map for easier comparison
    w_count = Enum.reduce(w, %{}, fn char, map ->
      Map.put(map, char, map[char] || 0) + 1
    end)

    # Initialize an empty list to store the indices of anagrams
    anagram_indices = []

    # Iterate over each character in S
    for i in 0..(length(s) - length(w)) do
      # Convert the current substring to a character count map for easier comparison
      substr_count = Enum.reduce(s[i..i + length(w) - 1], %{}, fn char, map ->
        Map.put(map, char, map[char] || 0) + 1
      end)

      # Check if the current substring is an anagram of W by comparing character counts
      if Enum.all?(w_count, fn {char, count} -> elem(substr_count[char], count) == count end) do
        # If it's an anagram, add its starting index to the list
        anagram_indices << i
      end
    end

    # Return the list of indices
    anagram_indices
  end
end
```