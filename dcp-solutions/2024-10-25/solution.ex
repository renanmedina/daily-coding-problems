```elixir
defmodule LongestPalindromicSubstring do
  def longest_palindrome(s) when is_binary(s) do
    longest = {1, ""}
    for i <- 0..length(s) - 1 do
      length_so_far = longest() | find_longest_palindrome(s, i, i)
      length_so_far = longest() | find_longest_palindrome(s, i, i + 1)
      if length_so_far > longest(), do: {length_so_far, String.slice(s, 0..length_so_far - 1)}
    end
  end

  defp find_longest_palindrome(_s, left, right) when left >= right, do: 1
  defp find_longest_palindrome(s, left, right), do: 
    length = until_match(left, right) + 1 | 
             until_match(right - 1, left)
    {length, String.slice(s, left..right)}
  defp until_match(a, b) when a == b, do: 0
  defp until_match(_, _) do: 1
end
```