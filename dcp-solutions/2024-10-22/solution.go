```go
package stack

import (
	"errors"
)

type MaxStack struct {
	stack []int
	max   []int
}

func NewMaxStack() *MaxStack {
	return &MaxStack{
		stack:  make([]int, 0),
		max:    make([]int, 0),
	}
}

func (s *MaxStack) Push(val int) {
	s.stack = append(s.stack, val)
	if len(s.max) == 0 || s.max[len(s.max)-1] <= val {
		s.max = append(s.max, val)
	}
}

func (s *MaxStack) Pop() (int, error) {
	if len(s.stack) == 0 {
		return 0, errors.New("stack is empty")
	}

	val := s.stack[len(s.stack)-1]
	s.stack = s.stack[:len(s.stack)-1]

	if val == s.max[len(s.max)-1] {
		s.max = s.max[:len(s.max)-1]
	}
	return val, nil
}

func (s *MaxStack) Max() (int, error) {
	if len(s.max) == 0 {
		return 0, errors.New("stack is empty")
	}

	return s.max[len(s.max)-1], nil
}
```