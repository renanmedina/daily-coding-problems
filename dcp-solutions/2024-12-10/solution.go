```go
package main

import "fmt"

func main() {
    funcs := make([]func(), 10)
    for i := range funcs {
        funcs[i] = func() int { return i }
    }
    for _, f := range funcs {
        fmt.Println(f())
    }
}
```