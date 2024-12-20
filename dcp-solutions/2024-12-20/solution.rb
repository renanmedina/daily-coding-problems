```ruby
def sum_of_primes(n)
  primes = Array.new(2 * n) { true }
  primes[0] = primes[1] = false
  i = 2
  while i * i < primes.size
    j = i * i
    while j < primes.size
      primes[j] = false
      j += i + i
    end
    i += 1
  end

  result = []
  for i in (2..(n / 2))
    break if not primes[i] && not primes[n - i]
    return [i, n-i] if not primes[n-i]
  end
  return [primes.index(true), primes.rindex(true)]
end
```