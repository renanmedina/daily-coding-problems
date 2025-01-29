```c
#include <stdio.h>
#include <stdlib.h>

typedef struct StackNode {
    int item;
    struct StackNode* next;
} StackNode;

struct Stack {
    StackNode** nodes;
};

StackNode* new_node(int item) {
    StackNode* node = (StackNode*) malloc(sizeof(StackNode));
    if (!node) {
        return NULL;
    }
    node->item = item;
    node->next = NULL;
    return node;
}

Stack* stack_new() {
    int size = 0; // assuming a fixed initial size
    StackNode** nodes = (StackNode**) malloc(sizeof(StackNode*) * size);
    if (!nodes) {
        return NULL;
    }
    for (int i = 0; i < size; i++) {
        nodes[i] = NULL;
    }
    return (Stack){ nodes };
}

void stack_push(Stack* self, int item) {
    StackNode** top = &self->nodes[0];
    while (*top != NULL && ((Stack*)(*top))->next == NULL) {
        *top = (*top)->next;
    }
    if ((*top == NULL) || (((Stack*)(*top))->item <= item)) {
        StackNode* new_node = new_node(item);
        self->nodes[0] = new_node;
        new_node->next = *top;
    } else {
        StackNode* temp = new_node(item);
        while (*top != NULL && ((Stack*)(*top))->next != NULL) {
            temp->next = ((Stack*)(*top))->next;
            ((Stack*)(*top))->next = temp;
            temp = ((Stack*)(*temp))->next;
        }
        temp->next = *top;
    }
}

int stack_pop(Stack* self) {
    int item = ((Stack*)self->nodes[0])->item;
    StackNode** top = &self->nodes[0];
    self->nodes[0] = (*top)->next;
    free(*top);
    return item;
}
```