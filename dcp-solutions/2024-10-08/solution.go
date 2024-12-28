```go
package main

import (
    "fmt"
    "strings"
)

func runLengthEncoding(s string) string {
    if len(s) == 0 {
        return ""
    }

    result := strings.Builder{}
    count := 1
    for i := 1; i < len(s); i++ {
        if s[i] == s[i-1] {
            count++
        } else {
            result.WriteString(fmt.Sprintf("%d%s", count, s[i-1]))
            count = 1
        }
    }

    result.WriteString(fmt.Sprintf("%d%s", count, s[len(s)-1]))

    return result.String()
}

func runLengthDecoding(encoded string) (string, error) {
    result := strings.Builder{}
    i := 0

    for i < len(encoded) {
        count, err := strconv.Atoi(encoded[i])
        if err != nil {
            return "", err
        }
        char := encoded[i+1]
        for j := 0; j < count; j++ {
            result.WriteByte(char)
        }

        i += 2
    }

    return result.String(), nil
}

func main() {
    s := "AAAABBBCCDAA"
    encoded := runLengthEncoding(s)
    fmt.Println(encoded)

    decoded, err := runLengthDecoding(encoded)
    if err != nil {
        panic(err)
    }
    fmt.Println(decoded)
}
```