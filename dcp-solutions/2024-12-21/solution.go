```go
func subarraySum(nums []int, k: int) []int {
    sumMap := make(map[int]int)
    sumMap[0] = 1
    
    total := 0
    result := []int{}
    
    for _, num := range nums {
        total += num
        
        if value, ok := sumMap[k-total]; ok {
            result = append(result, k-total+1)
        }
        
        sumMap[total]++
    }
    
    return result
}
```