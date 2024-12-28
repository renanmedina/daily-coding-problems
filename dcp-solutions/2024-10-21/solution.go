```markdown
package main

import (
    "fmt"
)

func combinationSum(candidates []int, target int)([]int) {
    fmt.Println(target)
    dp := make([]bool, target + 1)
    dp[0] = true
    for _, v := range candidates {
        for i := target; i >= v; i-- {
            if dp[i - v] == true && dp[i] == false {
                dp[i] = true
            }
        }
    }

    result := []int{}
    recursiveFunc(int(target), &result, 0, candidates)
    return result
}

func recursiveFunc(target int, result *[]int, start int, candidates []int) {
    if target < 0 || target == 0 {
        return 
    } else if target-start >= 0 {
        for i:=start;i<candidates.length();i++{
            currentNumber := candidates[i]
            newResult := make([]int, len(*result))
            *result = append(*result, currentNumber)
            recursiveFunc(target-currentNumber, &newResult, i, candidates)

            resultTemp := make([]int, len(newResult))
            copy(resultTemp, newResult)
            *result = resultTemp
        }
    } else {
        return 
    }

}

func main() {

}
```