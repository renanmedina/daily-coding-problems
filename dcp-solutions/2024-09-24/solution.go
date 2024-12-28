```markdown
package main

import (
	"container/heap"
	"fmt"
	"math/rand"
	"strconv"
)

type RandomizedSet struct {
	nums    []int
	next    map[int]int
}

func (rs *RandomizedSet) insert(val int) bool {
	if rs.next[val] == 0 {
		rs.nums = append(rs.nums, val)
		rs.next[val] = len(rs.nums) - 1
		return true
	}
	return false
}

func (rs *RandomizedSet) remove(val int) bool {
	if rs.next[val] != 0 {
		last := rs.nums[len(rs.nums)-1]
		rs.nums[rs.next[val]] = last
		rs.next[last] = rs.next[val]
		rs.next[val] = 0

		idx := rs.search(last)
		rs.nums[idx] = val
		rs.next[val] = idx
		rs.nums = rs.nums[:idx+1]
		return true
	}
	return false
}

func (rs *RandomizedSet) getRandom() int {
	rand.Seed(0x1234567890abcdef)
	return rs.nums[rand.Intn(len(rs.nums))]
}

func (rs *RandomizedSet) search(val int) int {
	idx := rs.next[val]
	for idx != 0 && rs.nums[idx] != val {
		idx = rs.next[rs.nums[idx]]
	}
	return idx
}

func main() {}
```