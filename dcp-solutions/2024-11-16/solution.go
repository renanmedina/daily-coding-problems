```markdown
type Node struct {
    Key   int
    Value interface{}
    Count int
    Prev  *Node
    Next  *Node
}

type LFUCache struct {
    Capacity int
    KeyToNode map[int]*Node
    CountToNodes map[int]*Node
    MinCount  int
}

func NewLFUCache(capacity int) *LFUCache {
    lfucache := &LFUCache{
        Capacity: capacity,
        KeyToNode: make(map[int]*Node),
        CountToNodes: make(map[int]*Node),
        MinCount:    1,
    }
    return lfucache
}

func (lfucache *LFUCache) Get(key int) interface{} {
    node, ok := lfucache.KeyToNode[key]
    if !ok {
        return nil
    }

    node.Count--
    if node.Count == 0 {
        delete(lfucache.CountToNodes, node.Count)
        lfucache.MinCount = lfucache.MinCount + 1
        for node.Next != nil && lfucache.MinCount == node.Count {
            prev := node.Prev
            next := node.Next

            prev.Next = next
            if next != nil {
                next.Prev = prev
            } else {
                lfucache.CountToNodes[lfucache.MinCount] = prev
            }

            delete(lfucache.KeyToNode, next.Key)
            delete(lfucache.CountToNodes, node.Count)

            node.Key = next.Key
            node.Value = next.Value
            node.Next = nil

        }
    }
    lfucache.CountToNodes[node.Count] = &node
    return node.Value
}

func (lfucache *LFUCache) Set(key int, value interface{}) {
    if _, ok := lfucache.KeyToNode[key]; ok {
        lfucache.Get(key)
    }

    if len(lfucache.KeyToNode) == lfucache.Capacity {
        minCount := lfucache.MinCount
        delete(lfucache.CountToNodes, minCount)

        node := lfucache.CountToNodes[minCount]
        for node.Next != nil {
            next := node.Next

            prev := node.Prev
            prev.Next = next
            if next != nil {
                next.Prev = prev
            } else {
                lfucache.CountToNodes[lfucache.MinCount] = prev
            }

            delete(lfucache.KeyToNode, next.Key)
        }
    }

    newNode := &Node{
        Key:   key,
        Value: value,
        Count: 1,
    }

    if lfucache.MinCount == 0 {
        lfucache.MinCount = 1
        lfucache.CountToNodes[1] = newNode
    } else {
        lfucache.CountToNodes[1] = newNode
    }

    lfucache.KeyToNode[key] = newNode

    newNode.Next = lfucache.CountToNodes[lfucache.MinCount]
    if lfucache.CountToNodes[lfucache.MinCount] != nil {
        lfucache.CountToNodes[lfucache.MinCount].Prev = newNode
    }
}
```