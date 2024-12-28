```markdown
package main

import "fmt"

func nextGreaterElement(nums []int) []int {
	n := len(nums)
	Stack, ans := make([]int, 0), make([]int, n)

	for i := n - 1; i >= 0; i-- {
		for len(Stack) > 0 && Stack[len(Stack)-1] <= nums[i] {
			Stack = Stack[:len(Stack)-1]
		}
		if len(Stack) == 0 || Stack[len(Stack)-1] != nums[i] {
			ans = append(ans, nums[i])
		} else {
			ans = append(ans, Stack[len(Stack)-1])
			nums[Stack[len(Stack)-1]] = nums[i]
			for i := n - 1; i >= 0 && nums[i] > nums[i-1]; i-- {
				ans = append(ans, nums[i])
			}
		}

		for len(Stack) > 0 && Stack[len(Stack)-1] < nums[i] {
			nums[Stack[len(Stack)-1]] = nums[i]
			Stack = Stack[:len(Stack)-1]
		}
		if len(Stack) == 0 || Stack[len(Stack)-1] != nums[i] {
			ans = append(ans, nums[i])
		} else {
			ans = append(ans, nums[i])
			nums[Stack[len(Stack)-1]] = -1
			for i := n - 1; i >= 0 && nums[i] > nums[i-1]; i-- {
				if nums[i] == -1 {
					break
				}
				ans = append(ans, nums[i])
			}

			if nums[Stack[len(Stack)-1]] < 0 {
				ans = append(ans, -1)
			} else if len(ans) > n {
				ans = ans[:n]
			}
		}
	}

	for i := 0; i < n; i++ {
		if nums[i] == -1 {
			ans[ans.index(i)] = nums[i + 1]
		}
	}

	return ans
}
```