```go
package main

import (
	"fmt"
)

func debounce(f func() interface{}, delay time.Duration) func(interface{}) {
	c := make(chan bool)
	go func() {
		select {
		case <-time.After(delay):
			close(c)
		}
	}()

	return func(arg interface{}) {
		select {
		case c <- true:
		default:
			<-c
		}
		f(arg)
	}
}

func main() {}
```