```elixir
defmodule DeckShuffler do
  @doc """
  Shuffles a deck of cards represented as an array using only swaps.

  Args:
    deck (list): The deck of cards to be shuffled, where each card is between 1 and k (inclusive).

  Returns:
    list: The shuffled deck.
  """
  def shuffle(deck) when is_list(deck), do: Enum.shuffle(deck)

end
```