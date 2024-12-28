```go
package main

import (
	"fmt"
)

type Point struct {
	X int
	Y int
}

func minSteps(points []Point) int {
	x := points[0].X
	y := points[0].Y
	moves := 0
	for i := 1; i < len(points); i++ {
	 dx := points[i].X - x
	 dy := points[i].Y - y
	 if dx > 0 && dy >= 0 {
		 moves += dx + dy
		 x = points[i].X
		 y = points[i].Y
	 } else if dx < 0 && dy <= 0 {
		 moves += dx + dy
		 x = points[i].X
		 y = points[i].Y
	 } else if dx > 0 && dy < 0 {
		 moves += dx - abs(dy) * 2
		 x = points[i].X
		 y = points[i].Y
	 } else if dx < 0 && dy > 0 {
		 moves += abs(dx) + dy * 2
		 x = points[i].X
		 y = points[i].Y
	 } else if dx == 0 && dy > 0 {
		 moves += dy
		 y = points[i].Y
	 } else if dx == 0 && dy < 0 {
		 moves += abs(dy)
		 y = points[i].Y
	 }
	}
	return moves
}

func abs(x int) int {
	if x < 0 {
		return -x
	} else {
		return x
	}
}

func main() {

}