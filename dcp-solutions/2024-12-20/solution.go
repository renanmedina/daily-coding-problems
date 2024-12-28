```go
package main

import (
	"fmt"
)

func sumOfPrimes(n int) (int, int) {
	sieve := make([]bool, n+1)
	for i := 0; i <= n; i++ {
		sieve[i] = true
	}
	primeNumbers := []int{2}

	for _, prime := range primeNumbers {
		if sieve[prime] {
			for num := prime * prime; num <= n; num += prime {
				sieve[num] = false
				primeNumbers = append(primeNumbers, num)
			}
		}
	}

	for i := 3; i < n/2+1; i++ {
		if sieve[i] {
			continue
		}
		for j := i + i; j <= n; j += i {
			sieve[j] = false
		}
	}

	mid := n / 2
	for _, prime := range primeNumbers {
		if prime <= mid && (n-prime) > mid {
			return prime, n - prime
		} else if prime == mid {
			continue
		}
	}
	return primeNumbers[0], primeNumbers[1]
}

func main() {
	fmt.Println(sumOfPrimes(4))
}
```