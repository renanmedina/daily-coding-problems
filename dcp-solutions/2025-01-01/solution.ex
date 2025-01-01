**Elixir Solution**
```markdown
defmodule StringReverser do
  @doc """
  Reverses words in a string.
  
  Args:
    s (String): The input string.
  
  Returns:
    String: The reversed string.
  """
  def reverse_words(s) do
    # Split the string into words
    words = String.split(s, " ")
    
    # Reverse each word and join them back together with spaces in between
    Enum.map(words, &reverse/1) |> Enum.join(" ")
  end

  @doc """
  Reverses words in a mutable string representation in-place.
  
  Args:
    s (String): The input string.
  """
  def reverse_in_place(s) do
    # Split the string into words
    words = String.split(s, " ")
    
    # Reverse each word and join them back together with spaces in between
    Enum.map(words, &reverse/1) |> Enum.join(" ") |> String.replace(~r/\s+/, " ", {:no_replace})
  end

private
defp reverse(word), do: String.reverse(word)
end
```