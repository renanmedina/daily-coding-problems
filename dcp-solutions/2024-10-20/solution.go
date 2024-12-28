```markdown
package main

import (
    "container/list"
    "errors"
)

type Flight struct {
    From string
    To   string
}

func findItinerary(flights []Flight, start string) []string {
    graph := make(map[string][]string)
    for _, flight := range flights {
        if !graph[flight.From] {
            graph[flight.From] = []string{}
        }
        graph[flight.From] = append(graph[flight.From], flight.To)
    }

    for k, v := range graph {
        sort.Slice(v, func(i, j int) bool { return v[i] < v[j] })
    }

    queue := list.New()
    result := make([]string, 0)

    visit := func(node string) {
        if len(result) == len(graph) {
            result = append(result, node)
            return
        }
        for end := range graph[node] {
            queue.PushBack(end)
        }

        for queue.Len() > 0 {
            end := queue.Front().Value.(string)
            queue.Remove(queue.Front())
            visit(end)
        }
    }

    if !graph[start] {
        return []string{}
    }

    visit(start)

    for i := len(result) - 1; i >= 0; i-- {
        result = append(result[:i], result[i+1:]...)
    }

    if len(result) != len(graph) {
        return nil
    }

    return result
}

func main() {

}
```