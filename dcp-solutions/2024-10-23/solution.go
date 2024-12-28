```go
package main

import (
	"fmt"
)

func countInversions(A []int) (int, int) {
	inversionCount := 0
	var merge func(left, right []int)
	merge = func(left, right []int) {
		merged := make([]int, len(left)+len(right))
		leftIndex := 0
		rightIndex := 0
		mergedIndex := 0

		for leftIndex < len(left) && rightIndex < len(right) {
			if left[leftIndex] <= right[rightIndex] {
				merged[mergedIndex] = left[leftIndex]
				leftIndex++
			} else {
				merged[mergedIndex] = right[rightIndex]
				rightIndex++
				inversionCount += len(left) - leftIndex
			}
			mergedIndex++
		}

		for leftIndex < len(left) {
			merged[mergedIndex] = left[leftIndex]
			leftIndex++
			mergedIndex++
		}

		for rightIndex < len(right) {
			merged[mergedIndex] = right[rightIndex]
			rightIndex++
			mergedIndex++
		}

		return inversionCount, merged
	}

	var mergeSort func(left, right []int)
	mergeSort = func(left, right []int) (inversionCount int, merged []int) {
		if len(left) == 0 {
			return inversionCount, make([]int, 0)
		}
		if len(right) == 0 {
			return inversionCount, left
		}

		if len(left) < len(right) {
			leftInversion, merged = mergeSort(left, right[:len(left)])
			return leftInversion + merged
		} else {
			rightInversion, merged = mergeSort(left[:len(right)], right)
			return merged + rightInversion
		}
	}

	inversionCount, _ = mergeSort(A, make([]int, 0))
	return inversionCount, A
}

func main() {

}
```