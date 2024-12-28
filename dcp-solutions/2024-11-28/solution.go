```markdown
package main

import (
    "errors"
)

func checkPossibility(nums []int) bool {
    if len(nums) <= 2 {
        return true
    }

    var count int = 0
    for i := 1; i < len(nums); i++ {
        if nums[i-1] > nums[i] {
            count++
            if count > 1 {
                return false
            }
            if nums[i-1] > nums[i] && (nums[i]+1) <= nums[i-1] {
                continue
            } else if nums[i-1] < nums[i] && (nums[i-1]-1) >= nums[i] {
                continue
            } else {
                return false
            }
        }
    }

    return true
}
```