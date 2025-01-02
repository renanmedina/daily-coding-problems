### Elixir Solution
```elixir
defmodule ReverseWordsInString do
  def reverse_words_in_string(input_str, delimiters) do
    # Split the input string into words and delimiters
    words_and_delimiters =
      String.split(input_str, "#{delimiters} ", [])

    # Separate the words from the delimiters
    words = Enum.filter(words_and_delimiters, fn item -> String.trim(item) != "" end)

    # Reverse the order of the words
    reversed_words = List.reverse(words)

    # Join the reversed words with delimiters
    result =
      Enum.reduce(reversed_words, "", &(&1 .. "&2" .. &3))

    # Add trailing delimiter if present
    case Enum.at(delimiters, 0) do
      when is_binary() -> String.append(result, delimiters)
      _ ->
        result
    end
  end
end
```