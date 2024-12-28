```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} A
 * @param {ListNode} B
 * @return {ListNode}
 */
function getIntersectionNode(A, B) {
    // first, calculate the length of both linked list
    let lenA = 0;
    let lenB = 0;
    let a = A;
    let b = B;

    while (a !== null) {
        lenA++;
        a = a.next;
    }

    while (b !== null) {
        lenB++;
        b = b.next;
    }

    // now, move the longer one forward by the difference of lengths
    if (lenA > lenB) {
        for (let i = 0; i < lenB; i++) {
            a = a.next;
        }
    } else {
        for (let i = 0; i < lenA; i++) {
            b = b.next;
        }
    }

    // now, both points are at the same distance from the end
    // so we just need to move forward together and see what happens
    let aCopy = A;
    while (a !== b) {
        aCopy = aCopy.next;
        a = a.next;
        b = b.next;
    }

    return aCopy;
}
```