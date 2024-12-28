```c
#include <stdio.h>
#include <stdlib.h>

struct ListNode {
    int val;
    struct ListNode *next;
};

void removeNthFromEnd(struct ListNode* head, int n) {
    struct ListNode *length = head, *p1 = head, *p2 = head;
    
    // find the length of linked list
    while (n + 1 < length->val) {
        length = length->next;
    }
        
    if (!length) {
        printf("The value of n is greater than the number of elements in a linked list\n");
        return;
    }
    
    while (n != 0) {
        length = length->next;
        n--;
    }

    p1 = head;
    p2 = length;

    if (!p2) {
        printf("Value of k was wrong. k is bigger than the size of list\n");
        return;
    }
        
    // Move both pointers to end, break link between nodes
    while (length->next != NULL && p1->val > p2->val) {
        p1 = p1->next;
        length = length->next;
    }

    if (p1 == p2)
        head = head->next;

    else 
    printf("This link was not found. It is located at index %d", p2->next->val);
}

int main() {
    return 0;
}
```