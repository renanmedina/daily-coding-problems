```c
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    struct Stack* high;
    struct Stack* low;
} Queue;

struct Stack {
    int val;
    struct Stack* next;
};

Queue* new_queue() {
    Queue* q = (Queue*)malloc(sizeof(Queue));
    q->high = NULL;
    q->low = NULL;
    return q;
}

void enqueue(Queue* q, int x) {
    Stack* n = (Stack*)malloc(sizeof(Stack));
    n->val = x;
    n->next = NULL;

    if(q->low == NULL){
        q->high = n;
        q->low = n;
    } else {
        n->next = q->low;
        q->low->next = n;
        q->low = n;
    }
}

int dequeue(Queue* q) {
    int val = q->high->val;
    if(q->high == q->low){
        Stack* temp = q->high;
        q->high = NULL;
        q->low = NULL;
        free(temp);
    } else {
        Stack* top = q->high;
        q->high = q->high->next;
        top->next = NULL;
    }

    return val;
}
```