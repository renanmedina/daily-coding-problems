```go
package main

import (
	"container/heap"
	"fmt"
)

type TimeMap struct {
	maps map[int]*TimeSlice
}

func NewTimeMap() *TimeMap {
	return &TimeMap{maps: make(map[int]*TimeSlice)}
}

func (t *TimeMap) set(key int, value int, time int) {
	if _, ok := t.maps[key]; !ok {
		t.maps[key] = make(*TimeSlice, 1, 1)
	}
	t.maps[key].insert(time, value)
}

func (t *TimeMap) get(key int, time int) int {
	for i := range t.maps[key] {
		if t.maps[key][i].time >= time {
			return t.maps[key][i].value
		}
	}
	return 0 // key not found or time is before any timestamp
}

type TimeSlice []TimeEntry

func (t TimeSlice) Len() int           { return len(t) }
func (t TimeSlice) Less(tha int, tha2 int) bool {
	return t[tha].time < t[tha2].time
}
func (t TimeSlice) Swap(i, j int)      { t[i], t[j] = t[j], t[i] }
func (t *TimeSlice) Push(x interface{}) { *t = append(*t, x.(TimeEntry)) }
func (t *TimeSlice) Pop() interface{}   {
	old := *t
	n := len(old)
	x := old[n-1]
	*t = old[0 : n-1]
	return x
}

type TimeEntry struct {
	time int
	value int
}
```