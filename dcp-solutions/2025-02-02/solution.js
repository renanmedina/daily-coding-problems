```javascript
// Definition for singly-linked list.
class ListNode {
    val: number;
    next: ListNode | null;

    constructor(val = 0, next = null) {
        this.val = val;
        this.next = next;
    }
}

function swapPairs(head) {
    if (!head || !head.next) return head;

    const dummyNode = new ListNode(0);
    dummyNode.next = head;
    let prev = dummyNode;

    while (prev.next && prev.next.next) {
        const firstNode = prev.next;
        const secondNode = prev.next.next;

        // reverse the link of first node
        prev.next = secondNode;
        firstNode.next = secondNode.next;
        secondNode.next = firstNode;

        // move forward three nodes
        prev = firstNode;
    }

    return dummyNode.next;
}
```