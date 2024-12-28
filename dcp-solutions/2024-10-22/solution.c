```c
#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int val;
    struct Node* next;
} Node;

typedef struct {
    Node* top;
} Stack;

Stack* newStack() {
    Stack* stack = malloc(sizeof(Stack));
    stack->top = NULL;
    return stack;
}

void push(Stack* stack, int val) {
    Node* newNode = malloc(sizeof(Node));
    newNode->val = val;
    newNode->next = stack->top;
    stack->top = newNode;
}

int pop(Stack* stack) {
    if (stack->top == NULL) {
        return -1; // or throw an error
    }
    int val = stack->top->val;
    Node* temp = stack->top;
    stack->top = stack->top->next;
    free(temp);
    return val;
}

int max(Stack* stack) {
    if (stack->top == NULL) {
        return -1; // or throw an error
    }
    int maxVal = stack->top->val;
    Node* temp = stack->top;
    while (temp->next != NULL) {
        if (temp->next->val > maxVal) {
            maxVal = temp->next->val;
        }
        temp = temp->next;
    }
    return maxVal;
}
```