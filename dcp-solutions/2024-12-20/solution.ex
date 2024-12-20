```elixir
defmodule Goldbach do
  @doc """
    Returns two prime numbers whose sum will be equal to the given number.

    ## Parameters

      - `n` (number): an even number greater than 2

    ## Returns

      A tuple of two prime numbers that add up to `n`. If there are more than one solution possible, returns the lexicographically smaller solution.
  """
  def solve(n) do
    # helper function to check if a number is prime
    def is_prime(num) do
      for i in 2..div(ceil(math.sqrt(num)), 1) do
        if rem(num, i) == 0, do: false, else: true
      end
      true
    end

    # helper function to find two prime numbers that add up to n
    def find_primes(n) do
      {a, b} = Enum.partition(1..n-2, fn(x) -> is_prime(x), [])
      head = Enum.find(a, fn(x) -> x + b, nil)
      if head == nil, do: find_primes(Enum.next(a))
                         else, do: [head, b]
    end

    # check all numbers from 3 to n/2
    for i in 3..div(n, 2) do
      prime_a = is_prime(i)
      case prime_a do
        true -> find_primes(n - i)
         false -> nil
      end
    end
  end

end
```