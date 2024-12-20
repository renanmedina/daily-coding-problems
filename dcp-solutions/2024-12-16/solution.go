```go
package main

import (
	"fmt"
)

type Node struct {
	Key   int
	Value int
	Time  int
	Next  *Node
}

type Map struct {
	Head *Node
	Tail *Node
}

func NewMap() *Map {
	return &Map{Head: nil, Tail: nil}
}

func (m *Map) Set(key, value, time int) {
	node := &Node{
		Key:   key,
		Value: value,
		Time:  time,
	}
	if m.Head == nil || node.Time > m.Head.Time {
		if m.Head != nil {
			m.Tail.Next = node
		} else {
			m.Head = node
		}
		m.Tail = node
	} else {
		var current *Node = m.Head
		for current.Next != nil && current.Next.Time < time {
			current = current.Next
		}
		if current.Next == nil || node.Time > current.Next.Time {
			current.Next = node
			m.Tail = node
		}
	}
}

func (m *Map) Get(key, time int) (value int) {
	var current *Node = m.Head
	for current != nil && current.Key != key {
		current = current.Next
	}
	if current == nil {
		return
	}
	if current.Time >= time {
		value = current.Value
	}
	return
}

func main() {}
```