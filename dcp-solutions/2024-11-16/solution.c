```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_KEY_LENGTH 128

typedef struct Node {
    char key[MAX_KEY_LENGTH];
    int value;
    int freq;
    struct Node* prev, * next;
} Node;

typedef struct LFUCache {
    Node* head;
    Node* tail;
    int size;
    int capacity;
    int frequencies[1000000];
} LFUCache;

LFUCache* new_LFUCache(int capacity) {
    LFUCache* lfu = (LFUCache*)malloc(sizeof(LFUCache));
    if(lfu == NULL) return NULL;
    lfu->capacity = capacity;
    lfu->head = NULL;
    lfu->tail = NULL;
    lfu->size = 0;
    memset(lfu->freqrequencies, 0, sizeof(int)*capacity);
    return lfu;
}

void removeNode(Node* node) {
    if(node == NULL || node->prev == NULL || node->next == NULL)
        return;

    node->prev->next = node->next;
    node->next->prev = node->prev;
}

void addToTail(Node* node) {
    if(lfu->tail == NULL)
        lfu->head = node;
    else
        lfu->tail->next = node;
    lfu->tail = node;
}

int getCount(int freq) {
    return lfu->freqrequencies[freq];
}

void updateFreq(int key, int value) {
    if(getCount(0) == 1 && lfu->size == 1)
        return;

    Node* currNode = lfu->head;
    while(currNode != NULL && strcmp(currNode->key, key) != 0){
        currNode = currNode->next;
    }
    
    if(currNode == NULL || lfu->tail == NULL ||strcmp(currNode->key, key) != 0) return;

    int freq = (currNode->freq + 1)%lfu->capacity;
    removeNode(currNode);
    if(getCount(freq) > getCount(0))
        freq++;
    updateFreq(key, value);
    lfu->size--;
    addToTail(lfu->head);
}

void set(int key, int value) {
    if(lfu->size >= lfu->capacity)
        removeLeastFrequent();

    Node* newnode = (Node*)malloc(sizeof(Node));
    strcpy(newnode->key, key);
    newnode->value = value;
    newnode->freq = 1;
    addToTail(newnode);
    updateFreq(key, value);
}

int get(int key) {
    if(lfu->size < lfu->capacity)
        return -1;

    Node* currNode = lfu->head;
    while(currNode != NULL && strcmp(currNode->key, key) != 0){
        currNode = currNode->next;
    }
    
    if(currNode == NULL || lfu->tail == NULL ||strcmp(currNode->key, key) != 0)
        return -1;

    removeNode(currNode);
    int freq = (currNode->freq + 1)%lfu->capacity;
    currNode->freq = freq;
    addToTail(currNode);

    return currNode->value;
}

void removeLeastFrequent(){
    Node* node = lfu->head;
    if(node == NULL) {
        free(node);
        return;
    }
    int minFreq = getCount(0);
    int firstKey = strcmp(node->key, lfu->head->key);
    if(firstKey < 0)
        minFreq++;
    
    while(lfu->tail != node && getCount(minFreq) > 1){
        removeNode(lfu->tail);
        lfu->size--;
        minFreq = (minFreq + 1)%lfu->capacity;
    }
    free(node);

}

void printLFU(LFUCache* lfu){
    Node* currNode = lfu->head;

    while(currNode != NULL) {
        printf("(%s, %d), ",currNode->key, currNode->value);
        if(getCount(0) > 1)
            printf("(");
        else
            printf(")");
        printf("(");
        for(int i=1; i<lfu->capacity; i++){
            if(getCount(i))
                printf("%d", i);
            printf(", ");
        }
        if(lfu->tail == currNode)
            printf(")\n");
        else
            printf("\n");
        currNode = currNode->next;
    }
}
```