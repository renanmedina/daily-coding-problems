```markdown
// hit_counter.go

type HitCounter struct {
	hits map[int]int
}

func NewHitCounter() *HitCounter {
	return &HitCounter{
		hits: make(map[int]int),
	}
}

func (h *HitCounter) Record(timestamp int) {
	if _, ok := h.hits[timestamp]; !ok {
		h.hits[timestamp] = 1
	} else {
		h.hits[timestamp]++
	}
}

func (h *HitCounter) Total() int {
	var total int
	for _, count := range h.hits {
		total += count
	}
	return total
}

func (h *HitCounter) Range(lower, upper int) int {
	if lower > upper {
		return 0
	}
	total := h.Total()
	countLowerUpper := h.Total() - h.Total() - h.Range(upper + 1)
	return total - countLowerUpper
}
```

This solution uses a simple dictionary to store the hits at different timestamps. The `Record` function checks if the timestamp already exists in the map, and if not, it adds it with a value of 1. If it does exist, it increments the count.

The `Total` function simply sums up all the values in the map.

The `Range` function calculates the number of hits that occurred between two timestamps by subtracting the total number of hits after removing the upper timestamp from the total number of hits.