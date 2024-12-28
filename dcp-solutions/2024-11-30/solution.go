```markdown
package main

import (
    "fmt"
)

func letterCombinations(digits string) []string {
    if len(digits) == 0 {
        return []string{}
    }

    var result []string
    mapping := map[rune][][]rune{
        '2': [][]rune{'a', 'b', 'c'},
        '3': [][]rune{'d', 'e', 'f'},
        '4': [][]rune{'g', 'h', 'i'},
        '5': [][]rune{'j', 'k', 'l'},
        '6': [][]rune{'m', 'n', 'o'},
        '7': [][]rune{'p', 'q', 'r', 's'},
        '8': [][]rune{'t', 'u', 'v'},
        '9': [][]rune{'w', 'x', 'y', 'z'},
    }

    dfs(&result, 0, digits, mapping)
    return result
}

func dfs(result *[]string, index int, number string, mapping map[rune][][]rune) {
    if index == len(number) {
        result = append(*result, "")
        return
    }

    for _, letter := range mapping[number[index]][0] {
        dfs(result, index+1, number, mapping)
        (*result)[*result.len()] += string(letter)
    }
}

func main() {

}
```