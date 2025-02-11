```go
package main

import (
	"container/heap"
	"fmt"
)

type MaxHeap struct {
	h *[]int
}

func (m *MaxHeap) Push(x interface{}) {
	n := len(m.h)
	m.h = append(m.h, x.(int))
	heap.Fix(m.h, n)
}

func (m *MaxHeap) Pop() interface{} {
	old := m.h
	n := len(old)
	x := old[n-1]
	m.h = old[0 : n-1]
	if n > 0 {
		heap.Fix(m.h, 0)
	}
	return x
}

func (m *MaxHeap) Empty() bool {
	return len(m.h) == 0
}

type MaxHeapItem interface {
	int | int32 | string | *int | *string `go_type:"int"`
}

var _ heap.Interface = (*MaxHeap)(nil)

func NewMaxHeap() *MaxHeap {
	return &MaxHeap{h: make([]int, 0)}
}
```