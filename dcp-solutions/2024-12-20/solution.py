```python
def goldbach(n):
    def is_prime(x):
        if x < 2:
            return False
        for i in range(2, int(x**0.5) + 1):
            if x % i == 0:
                return False
        return True

    # find the largest prime number less than n/2
    max_prime = None
    for i in range(n//2 - 1, 1, -1):
        if is_prime(i):
            max_prime = i
            break

    # find two primes that add up to n using trial division
    for i in range(3, max_prime, 2):
        j = n - i
        if is_prime(j) and j < i:
            return (i, j)
    raise ValueError("No solution found")
```