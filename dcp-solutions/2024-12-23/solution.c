```c
#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* next;
    struct Node* prev;
} Node;

Node* createNode(int data) {
    Node* newNode = (Node*) malloc(sizeof(Node));
    if (!newNode) {
        printf("Memory error\n");
        return NULL;
    }
    newNode->data = data;
    newNode->next = newNode->prev = NULL;
    return newNode;
}

int isPalindrome(Node* head) {
    if (head == NULL || head->next == NULL)
        return 1;

    Node* slow = head;
    Node* fast = head;

    while (fast->next != NULL && fast->next->next != NULL) {
        slow = slow->next;
        fast = fast->next->next;
    }

    // check reverse from second half
    Node* firsthalfEnd = slow;
    Node* secondhalfStart = slow->next;

    while (secondhalfStart != NULL) {
        Node* temp1 = firsthalfEnd;
        Node* temp2 = secondhalfStart;

        while(temp1->next != temp2) {
            if(temp1->data != temp2->data)
                return 0;
            temp1 = temp1->next;
            temp2 = temp2->next;
        }

        secondhalfStart = secondhalfStart->next;
    }
    return 1;
}
```