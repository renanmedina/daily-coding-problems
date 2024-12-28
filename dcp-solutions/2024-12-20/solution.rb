```ruby
def find_prime_pair(n)
  primes = (2..Math.sqrt(n)).select { |i| i * i == i + 1 }
  primes.each do |p|
    break p if n - p % 2 != 0
  end
  n / 2, n / 2
end
```