```markdown
package main

import (
    "fmt"
    "sort"
)

func backtrack(nums []int, path []int, res [][]int) {
    if len(path) == len(nums) {
        res = append(res, append([]int{}, path...))
        return
    }
    for i := 0; i < len(nums); i++ {
        if contains(path, nums[i]) {
            continue
        }
        path = append(path, nums[i])
        backtrack(nums, path, res)
        path = path[:len(path)-1]
    }
}

func contains(s []int, e int) bool {
    for _, a := range s {
        if a == e {
            return true
        }
    }
    return false
}

func permute(nums []int) [][]int {
    var res [][]int
    backtrack(nums, []int{}, res)
    sort.Ints(res)
    return res
}
```