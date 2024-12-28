```markdown
func sortCharacters(s string) {
    counts := map[rune]int{}
    for _, c := range s {
        counts[c]++
    }

    first, second, third := []rune{}, []rune{}, []rune{}
    for k := range counts {
        for i := 0; i < counts[k]; i++ {
            if k == 'R' {
                first = append(first, k)
            } else if k == 'G' {
                second = append(second, k)
            } else {
                third = append(third, k)
            }
        }
    }

    var result []rune
    for len(first) > 0 || len(second) > 0 || len(third) > 0 {
        if len(first) == 0 {
            result = append(result, second[0])
            second = second[1:]
        } else if len(second) == 0 {
            result = append(result, first[0])
            first = first[1:]
        } else if len(third) == 0 {
            result = append(result, third[0])
            third = third[1:]
        } else {
            if counts['R'] >= counts['G'] && counts['R'] > counts['B'] {
                result = append(result, 'R')
                counts['R']--
            } else if counts['G'] > counts['R'] || counts['G'] == counts['R'] && counts['G'] > counts['B'] {
                result = append(result, 'G')
                counts['G']--
            } else {
                result = append(result, 'B')
                counts['B']--
            }
        }
    }

    fmt.Println(string(result))
}
```