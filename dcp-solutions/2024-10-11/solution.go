```go
package main

import (
	"sort"
)

func checkArbitrage(exchanges [][]int64) bool {
	var exchangesMap = make(map[string]map[int64]int64)
	for i, row := range exchanges {
		for j, rate := range row {
			if _, ok := exchangesMap[fmt.Sprintf("%d_%d", i, j)]; ok {
				exchangesMap[fmt.Sprintf("%d_%d", i, j)][j] = int64(0)
			}
			exchangesMap[fmt.Sprintf("%d_%d", i, j)] = make(map[int64]int64)
			exchangesMap[fmt.Sprintf("%d_%d", i, j)][i] = rate
		}
	}

	for k := range exchangesMap {
		values := exchangesMap[k]
		var arr []int64
		for i := range values {
			arr = append(arr, values[i])
		}
		sort.Slice(arr, func(i, j int) bool { return arr[i] < arr[j] })
		if i, j := len(arr)-1, 0; i > j && arr[j]*arr[len(arr)-1] > arr[i]*arr[i-1] {
			return true
		}
	}

	return false
}
```