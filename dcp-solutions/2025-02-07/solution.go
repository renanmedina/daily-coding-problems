```markdown
package main

import (
    "fmt"
    "math"
)

type Point struct {
    X float64
    Y float64
}

func distance(point1, point2 Point) (float64) {
    return math.Sqrt(float64((point1.X - point2.X) * (point1.X - point2.X)) + 
                   float64((point1.Y - point2.Y) * (point1.Y - point2.Y)))
}

func findKNearestPoints(points []Point, central Point, k int) []Point {
    // Create a slice to store the points along with their distances from the central point
    pointsWithDistances := make([]struct{ p Point; d float64 }, len(points))
    
    for i, point := range points {
        distanceVal := distance(point, central)
        pointsWithDistances[i] = struct{ p Point; d float64 }{p: point, d: distanceVal}
    }
    
    // Sort the slice based on distances
    sort.Slice(pointsWithDistances, func(i, j int) bool { return pointsWithDistances[i].d < pointsWithDistances[j].d })
    
    // Return the k nearest points
    return getKPoints(pointsWithDistances, k)
}

func getKPoints(points []struct{ p Point; d float64 }, k int) []Point {
    result := make([]Point, 0, k)
    for _, point := range points[:k] {
        result = append(result, point.p)
    }
    return result
}

func main() {
    // Test the function
    points := []Point{
        {X: 0.0, Y: 0.0},
        {X: 5.0, Y: 4.0},
        {X: 3.0, Y: 1.0},
    }
    central := Point{X: 1.0, Y: 2.0}
    k := 2
    
    nearestPoints := findKNearestPoints(points, central, k)
    
    for _, point := range nearestPoints {
        fmt.Printf("(%f, %f) ", point.X, point.Y)
    }
    fmt.Println()
}
```