```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Node {
    int key;
    int value;
    struct Node* prev;
    struct Node* next;
} Node;

typedef struct LRUCache {
    int capacity;
    Node* head;
    Node* tail;
    Node** nodes;
} LRUCache;

LRUCache* lru_cache(int capacity) {
    LRUCache* cache = (LRUCache*) malloc(sizeof(LRUCache));
    cache->capacity = capacity;
    cache->head = NULL;
    cache->tail = NULL;
    cache->nodes = (Node**) calloc(capacity, sizeof(Node*));

    for (int i = 0; i < capacity; i++) {
        Node* node = (Node*) malloc(sizeof(Node));
        node->prev = NULL;
        node->next = NULL;
        cache->head = add_node(cache->head, node);
        cache->nodes[i] = node;
    }

    return cache;
}

Node* add_node(Node* head, Node* node) {
    if (head == NULL) {
        node->next = NULL;
        node->prev = NULL;
        return node;
    }
    Node* tail = find_tail(head);
    tail->next = node;
    node->prev = tail;
    return head;
}

Node* find_tail(Node* head) {
    if (head == NULL || head->next == NULL) return head;
    Node* current = head;
    while (current->next != NULL) current = current->next;
    return current;
}

int remove_node(Node* node) {
    if (node->prev == NULL) {
        cache->head = node->next;
        if (cache->head != NULL) cache->head->prev = NULL;
    } else {
        node->prev->next = node->next;
    }
    if (node->next == NULL) {
        cache->tail = node->prev;
        cache->tail->next = NULL;
    }
    return 1; // removed
}

int get_value(Node* node, int key) {
    for (Node* current = node; current != NULL; current = current->next) {
        if (current->key == key) return current->value;
    }
    return -1; // not found
}

void remove_node_from_list(Node* node) {
    remove_node(node);
    free(node);
}

int set_value(LRUCache* cache, int key, int value) {
    Node* node = find_node(cache->nodes, key);
    if (node != NULL) {
        remove_node_from_list(node);
        node->value = value;
        add_node(node->prev, node);
        return 1; // set
    } else {
        if (cache->capacity == 0) return 0; // full
        Node* new_node = (Node*) malloc(sizeof(Node));
        new_node->key = key;
        new_node->value = value;
        add_node(cache->head, new_node);
        cache->nodes[key] = new_node;
        return 1; // set
    }
}

int get(LRUCache* cache, int key) {
    Node* node = find_node(cache->nodes, key);
    if (node != NULL) {
        remove_node_from_list(node);
        add_node(node->prev, node);
        return node->value;
    } else {
        return -1; // not found
    }
}

Node* find_node(Node** nodes, int key) {
    for (int i = 0; i < *nodes; i++) {
        if ((*nodes)[i]->key == key) return (*nodes)[i];
    }
    return NULL;
}
```