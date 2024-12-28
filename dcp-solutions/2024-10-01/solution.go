```go
func reconstructSentence(words []string, a string) []string {
    var freq map[rune]int
    for _, word := range words {
        for _, c := range word {
            freq[c]++
        }
    }

    ans := make([]rune, 0)
    for _, w := range words {
        ok := true
        for _, c := range w {
            if freq[c] == 0 {
                ok = false
                break
            }
            freq[c]--
        }
        if ok {
            ans = append(ans, rune(w[0]))
        }
    }

    s := string(ans)
    if a != s {
        return nil
    } else {
        result := make([]string, 0)
        i := 0
        for _, word := range words {
            if i < len(a) && a[i] == rune(word[0]) {
                result = append(result, string(word))
                i++
            }
        }
        return result
    }
}
```