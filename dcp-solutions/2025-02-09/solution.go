```markdown
package main

import (
	"math/rand"
)

type Distribution struct {
	numbers []float64
probabilities []float64
}

func NewDistribution(numbers, probabilities []float64) *Distribution {
	return &Distribution{
		numbers: numbers,
		probabilities: probabilities,
	}
}

func (d *Distribution) Generate() float64 {
	sum := 0.0
	rand.Seed(int64(rand.Intn(2**32)))
	for i, p := range d.probabilities {
		sum += p
		if rand.Float64()*sum < float64(p) {
			return d.numbers[i]
		}
	}

	panic("this should never happen")
}
```