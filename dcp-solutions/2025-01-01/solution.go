```go
package main

import (
    "fmt"
)

func reverseWords(s *string) {
    words := strings.Split(*s, " ")
    for i := 0; i < len(words); i++ {
        (*s)[i] = words[len(words)-1-i]
    }
}

func solve(s []byte) {
    left, right := 0, len(s) - 1
    for ; left < right; left, right = left+1, right-1 {
        if s[left] == ' ' || s[right] == ' ' {
            continue
        }
        temp := s[left]
        s[left] = s[right]
        s[right] = temp
    }
}

func reverseWordsInPlace(s *[]byte) {
    left := 0
    for right := len(*s) - 1; right >= 0; right-- {
        if (*s)[right] == ' ' {
            continue
        }
        for left < right && (*s)[left] != ' ' {
            left++
        }
        temp := (*s)[left]
        (*s)[left] = (*s)[right]
        (*s)[right] = temp
    }
}

func main() {
    s := []byte("hello world here")
    reverseWords(&s)
    fmt.Println(string(s))  // Output: "here world hello"
}
```