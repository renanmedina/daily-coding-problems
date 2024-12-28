```c
// Definition for singly-linked list.
typedef struct ListNode {
    int val;
    struct ListNode *next;
} ListNode;

ListNode* getIntersectionNode(ListNode* headA, ListNode* headB) {
    // Calculate the lengths of both lists
    int lenA = 0;
    ListNode* tempA = headA;
    while (tempA != NULL) {
        lenA++;
        tempA = tempA->next;
    }

    int lenB = 0;
    ListNode* tempB = headB;
    while (tempB != NULL) {
        lenB++;
        tempB = tempB->next;
    }

    // Move the longer list forward
    if (lenA > lenB) {
        for (int i = 0; i < lenB; i++) {
            headA = headA->next;
        }
    } else {
        for (int i = 0; i < lenA; i++) {
            headB = headB->next;
        }
    }

    // Move both lists forward until they meet
    while (headA != NULL && headB != NULL) {
        if (headA == headB) return headA;
        headA = headA->next;
        headB = headB->next;
    }

    // If no intersection is found, return NULL
    return NULL;
}
```