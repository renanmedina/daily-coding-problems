```markdown
package main

import "fmt"

func divide(a int, b int) (int, bool) {
    if a == 0 || b == 0 {
        return 0, false
    }
    
    sign := -1
    if (a > 0 && b > 0) || (a < 0 && b < 0) {
        sign = 1
    } else if (a > 0 && b < 0) || (a < 0 && b > 0) {
        return 0, false
    }

    a *= sign
    b *= sign

    if a < b {
        return 0, false
    }

    quotient := 0
    shift := 0

    for ; b <= a / 2; b <<= 1, shift++ {
        quotient += shift
    }

    while (a - (quotient << shift)) >= b {
        quotient += 1 << (shift - 1)
        for ; ((a - (quotient << shift)) / b) >= (1 << (shift - 1)); shift-- {}
    }

    return quotient * sign, true
}

func main() {
    // test the function
}
```