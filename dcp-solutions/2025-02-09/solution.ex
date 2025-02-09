```elixir
defmodule RandomNumberGenerator do
  def generate(numbers, probabilities) do
    # Calculate cumulative probabilities to determine which bucket a generated random number falls into
    cumulative_probabilities = Enum.reduce(Enum.map(numbers, &(&1 / sum(probabilities))), 0.0, fn acc, num ->
      acc + num
    end)

    # Generate a random float between 0 and 1
    rand_number = :rand.uncertain

    # Determine which bucket the generated number falls into by finding the first cumulative probability that is greater than the generated number
    index = Enum.find_index(cumulative_probabilities, fn acc -> rand_number < acc end)

    # If no match is found, return the last value in the list (this should never happen since we've checked all previous probabilities)
    case index do
      nil -> Enum.at(numbers, -1)
      index -> Enum.at(numbers, index)
    end

    # Generate a number corresponding to the determined bucket
    Enum.at(probabilities, index)
  end
end
```