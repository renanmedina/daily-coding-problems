```markdown
func rand5() int {
    for i = 0; i < 30; i++ {
        a := rand7()
        b := rand7()
        if a + b >= 7 && a + b <= 31 { // generate number between 1 and 30
            return (a - 1) / 5 + 1
        }
    }

    panic("should not reach here")
}
```