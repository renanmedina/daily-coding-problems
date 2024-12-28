```c
#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int val;
    struct Node* next;
} Node;

Node* mergeKLists(Node** lists) {
    if (*lists == NULL || *lists[0] == NULL) return NULL;
    
    // Priority queue to store nodes with their values as keys
    Node** pq = (Node**)malloc(sizeof(Node*) * 10);
    int top = 0;

    for (int i = 0; i < 10; i++) {
        if ((*lists)[i] == NULL) break;
        pq[top++] = (*lists)[i];
        (*lists)[i] = (*lists)[i]->next;
    }

    while (top > 1) {
        // Extract the node with smallest value
        Node* smallest = pq[0];
        int index = 0;

        for (int i = 1; i < top; i++) {
            if (pq[i] != NULL && pq[i]->val < smallest->val) {
                smallest = pq[i];
                index = i;
            }
        }

        // Remove the extracted node from the priority queue
        top--;
        Node* temp = pq[index];
        Node** idx = &pq[top];
        while (idx > &pq[0]) {
            *(idx - 1) = *(idx);
            idx--;
        }
        *idx = temp;

        if (smallest->next != NULL) {
            // Insert the next node of the smallest into the priority queue
            Node** nxtIdx = &(pq[top]);
            while (*nxtIdx > &smallest) {
                *(nxtIdx - 1) = *(nxtIdx);
                nxtIdx--;
            }
            *nxtIdx = smallest->next;
        }

        // Update smallest's next node if necessary
        if (index < top && pq[index] != NULL && pq[index]->val > smallest->val + pq[index]->val) {
            (*lists)[index] = smallest->next;
        }
    }

    return pq[0];
}

Node* newNode(int val) {
    Node* temp = (Node*)malloc(sizeof(Node));
    temp->val = val;
    temp->next = NULL;
    return temp;
}
```