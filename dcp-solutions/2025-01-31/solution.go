```go
func partition(lst []int, x int) [][]int {
    less := make([]int, 0)
    equal := make([]int, 0)
    greater := make([]int, 0)

    for _, num := range lst {
        if num < x {
            less = append(less, num)
        } else if num == x {
            equal = append(equal, num)
        } else {
            greater = append(greater, num)
        }
    }

    return [][][]int{{less, equal, greater}}
}
```