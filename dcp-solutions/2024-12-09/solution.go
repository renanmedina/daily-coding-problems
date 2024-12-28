```go
import (
    "math/rand"
    "time"
)

func randomNotIn(lst []int, n int) int {
    // Initialize the seed with the current time
    rand.Seed(time.Now().UnixNano())

    // Generate a number from 0 to n-1
    num := rand.Intn(n)

    // If the generated number is in the list, generate again
    for lst.Contains(num) {
        num = rand.Intn(n)
    }

    return num
}
```