```go
package main

import (
    "fmt"
)

func reverseWords(s string, delimiters []string) string {
    words := []string{}
    word := ""
    for _, c := range s {
        if isDelimiter(c, delimiters) {
            if len(word) > 0 {
                words = append(words, word)
                word = ""
            }
        } else {
            word += string(c)
        }
    }
    if len(word) > 0 {
        words = append(words, word)
    }

    reversed := make([]rune, 0, len(s))
    for i := len(words) - 1; i >= 0; i-- {
        reversed = append(reversed, []rune(words[i])...)
    }
    return string(reversed)
}

func isDelimiter(c rune, delimiters []string) bool {
    for _, delimiter := range delimiters {
        if c == rune(delimiter[0]) {
            return true
        }
    }
    return false
}
```