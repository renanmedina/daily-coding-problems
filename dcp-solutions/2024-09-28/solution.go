```go
package main

import (
	"container/heap"
)

type Color struct {
	Index int
	Cost  int64
}

type Pair struct {
	Color Color
	Cost   int64
}

func minCost(n int, k int, costs [][]int64) (res int64) {
	var colors = make([][]Color, k)
	for i := range colors {
		colors[i] = make([]Color, n)
	}
	for i := 0; i < n; i++ {
		for j := 0; j < k; j++ {
			colors[j][i].Index = i
			colors[j][i].Cost = costs[i][j]
		}
	}

	var minHeap = hp{}
	for _, col := range colors {
		heap.Push(&minHeap, Pair{Color: col[0], Cost: col[0].Cost})
	}

	for j := 1; j < k; j++ {
		lastColor := heap.Pop(&minHeap).(Pair)
		for i := lastColor.Index + 1; i < n; i++ {
			nextColor := &colors[j][i]
			nextColor.Cost = lastColor.Cost + costs[i][j]

			if len(minHeap) == 0 || minHeap[0].Cost > nextColor.Cost {
				heap.Pop(&minHeap)
				heap.Push(&minHeap, Pair{Color: *nextColor, Cost: nextColor.Cost})
			}
		}
	}

	for _, color := range colors[1:] {
		if len(minHeap) == 0 || minHeap[0].Cost > color[0].Cost {
			heap.Pop(&minHeap)
			heap.Push(&minHeap, Pair{Color: *color[0], Cost: color[0].Cost})
		}
	}

	res = minHeap[0].Cost
	return res
}

type hp struct{ list []Pair }
func (h hp) Len() int           { return len(h.list) }
func (h hp) Less(i, j int) bool { return h.list[i].Cost < h.list[j].Cost }
func (h hp) Swap(i, j int)      { h.list[i], h.list[j] = h.list[j], h.list[i] }
func (h *hp) Push(v interface{}) { h.list = append(h.list, v.(Pair)) }
func (h *hp) Pop() interface{} {
	t := h.list[len(h.list)-1]
	h.list = h.list[:len(h.list)-1]
	return t
}

func main() {

}
```