```go
func fullJustify(words []byte, k int) [][]byte {
    result := [][]byte{}
    wordsLen := len(words)
    wordCount := 0
    currLine := make([]byte, k*2)

    for i := range words {
        if i != 0 && (i+1)*k > wordsLen {
            // Pad spaces to the right
            currLine = append(currLine, make([]byte, len(k-len(currLine)))...)
            result = append(result, append(append(currLine[:len(currLine)-1], '\n'), []byte{wordCount}...))
            wordCount = 0
            currLine = make([]byte, k*2)
        }
        for j := k - (i+1)*k/wordsLen; j > 0; j-- {
            currLine[wordCount] = ' '
            wordCount++
        }

        currLine[wordCount] = words[i]
        wordCount++

        if i == wordsLen-1 && len(currLine) != k*2 {
            // Add the last word
            for j := len(k) - (len(currLine)-wordCount+1); j > 0; j-- {
                currLine[wordCount] = ' '
                wordCount++
            }
        }
    }

    result[0] = append(result[0], currLine[:len(currLine)]...)

    return result
}
```