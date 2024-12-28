```markdown
package main

import (
    "fmt"
)

func maxSubArray(nums []int) int {
    // Handle empty array
    if len(nums) == 0 {
        return 0
    }

    // Initialize maximum sum and current sum to negative infinity
    max_sum := int(-1e9)
    current_sum := 0

    // Iterate over the array, updating current sum at each step
    for _, num := range nums {
        current_sum = max(num, current_sum+num)

        // Update max sum if current sum is greater
        if current_sum > max_sum {
            max_sum = current_sum
        }
    }

    return max_sum
}

func main() {
}
```