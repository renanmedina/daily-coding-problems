```markdown
package main

import (
    "fmt"
)

func minSteps(points [][]int) int {
    x, y := points[0]
    visited := map[string]bool{fmt.Sprintf("%d %d", x, y): true}

    var dx = []int{-1, -1, -1, 0, 1, 1, 1, 0}
    var dy = []int{-1, 0, 1, 1, 1, 0, -1, -1}

    steps := 0
    for i := 1; i < len(points); i++ {
        x, y = points[i-1]
        nx, ny := points[i][0], points[i][1]

        for dxIndex, dxValue := range dx {
            for dyIndex, dyValue := range dy {
                newX, newY := x + dxValue, y + dyValue
                if visited[fmt.Sprintf("%d %d", newX, newY)] && (nx == newX || ny == newY) {
                    steps += 2
                    break
                }
                newX, newY = nx + dxValue, ny + dyValue
            }
        }

        x, y = newX, newY
        visited[fmt.Sprintf("%d %d", x, y)] = true
    }

    return steps
}

func main() {
    fmt.Println(minSteps([][][]int{{0, 0}, {1, 1}, {1, 2}}))
}
```