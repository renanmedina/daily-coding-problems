```go
package main

import (
	"fmt"
)

func nthPerfectNumber(n int) int {
	count := 0
	num := 1
	for {
		sum := 0
		for num > 0 {
			digit := num % 10
			sum += digit
			num /= 10
		}
		if sum == 10 {
			count++
			if count == n {
				return sum
			}
		}
		num++
	}
}

func main() {
	fmt.Println(nthPerfectNumber(1)) //19
	fmt.Println(nthPerfectNumber(2)) //28
	fmt.Println(nthPerfectNumber(3)) //38
} 
```