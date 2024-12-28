```markdown
package main

import (
    "fmt"
)

func shuffleDeck(deck []int) {
    n := len(deck)
    for i := n - 1; i > 0; i-- {
        j := randInt(i, n-1)
        deck[i], deck[j] = deck[j], deck[i]
    }
}

func randInt(a int, b int) int {
    return a + randIntMod(b-a+1, 999_999_999)
}
func randIntMod(m int, offset int) int {
    return (randInt(0, m-1) + offset) % m
}

func main() {
    var deck = []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
    shuffleDeck(deck)
    for i := range deck {
        fmt.Printf("%d ", deck[i])
    }
}
```