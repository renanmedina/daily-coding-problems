```go
package main

import (
	"fmt"
)

func grayCode(n int) []string {
	var grayCode []string
	for i := 0; i < (1 << n); i++ {
		bin := fmt.Sprintf("%b", i)
		gray := ""
		for j := len(bin) - 1; j >= 0; j-- {
			if bin[j] == '0' && gray != "" && gray[gray Len-1] == '1' {
				gray = string(reverse(rune(gray)) + rune(bin[j]))
			} else {
				gray += string(bin[j])
			}
		}
		grayCode = append(grayCode, gray)
	}

	return grayCode
}

func reverse(chars []rune) []rune {
	runes := make([]rune, len(chars))
	for i, r := range chars {
		runes[len(runes)-1-i] = r
	}
	return runes
}

func main() {}
```