```c
#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* next;
} Node;

typedef struct Log {
    Node* head;
    Node* tail;
    int size;
} Log;

Log* create_log() {
    Log* log = (Log*)malloc(sizeof(Log));
    log->head = NULL;
    log->tail = NULL;
    log->size = 0;
    return log;
}

void record(Log* log, int order_id) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->data = order_id;
    node->next = NULL;

    if(log->head == NULL) {
        log->head = node;
        log->tail = node;
    } else {
        log->tail->next = node;
        log->tail = node;
    }
    log->size++;
}

int get_last(Log* log, int i) {
    Node* current = log->head;

    // Skip N - 1 nodes
    for(int j = 0; j < log->size - i - 1; j++) {
        current = current->next;
    }

    return current->data;
}
```