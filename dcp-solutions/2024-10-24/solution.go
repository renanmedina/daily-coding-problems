```markdown
package main

import (
    "fmt"
)

func rand7() int {
    a := rand5()
    b := rand5()

    // Use casework on sum of a and b to generate range 8, then adjust by subtracting 1
    if a + b < 8 {
        return (a + b) % 7 + 1
    } else {
        return (a + b - 8) % 7 + 1
    }
}
```