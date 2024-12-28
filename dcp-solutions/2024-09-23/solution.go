```go
package main

import (
	"math/rand"
	"time"
)

const numSamples int = 1000000

func estimateCircleArea() float64 {
	rand.Seed(time.Now().UnixNano())
	samplesInsideCircle := 0.0

	for i := 0; i < numSamples; i++ {
		x := rand.Float64() * 2 - 1
		y := rand.Float64() * 2 - 1

		if x*x + y*y <= 1 {
			samplesInsideCircle++
		}
	}

	return 4.0 * float64(samplesInsideCircle) / float64(numSamples)
}

func main() {
	areaEstimate := estimateCircleArea()
	fmt.Printf("%.3f", areaEstimate)
}