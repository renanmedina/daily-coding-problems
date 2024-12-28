```markdown
func checkBrackets(s string) bool {
    stack := make([]byte, 0)
    mapping := map[byte]byte{
        ')': '(',
        '}': '{',
        ']': '[',
    }

    for _, c := range s {
        if c == '(' || c == '{' || c == '[' {
            stack = append(stack, c)
        } else if c == ')' || c == '}' || c == ']' {
            if len(stack) == 0 {
                return false
            }
            lastChar := stack[len(stack)-1]
            if mapping[c] != lastChar {
                return false
            }
            stack = stack[:len(stack)-1]
        }
    }

    return len(stack) == 0
}
```