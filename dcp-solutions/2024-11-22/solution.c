```c
#include <stdlib.h>

struct ListNode {
    int val;
    struct ListNode *next;
};

struct ListNode* reverseList(struct ListNode* head) {
    if (!head || !head->next)
        return head;

    // Reverse between the 2nd node and last node of list
    struct ListNode* prev = NULL, * curr = head, * nextTemp = NULL;
    while (curr) {
        nextTemp = curr->next; // store next node temporarily
        curr->next = prev;      // reverse link of current node
        prev          = curr;  // move prev and curr one step forward
        curr         = nextTemp;
    }

    return prev; // head is now the new tail node
}
```