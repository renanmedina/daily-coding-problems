```c
#include <stdlib.h>
#include <string.h>

typedef struct Heap {
    int* items;
    int size;
    int capacity;
} Heap;

void initHeap(Heap* heap) {
    heap->items = (int*)malloc(sizeof(int));
    heap->size = 0;
    heap->capacity = 1;
}

void pushHeap(Heap* heap, int item) {
    if (heap->size == heap->capacity) {
        heap->capacity *= 2;
        heap->items = (int*)realloc(heap->items, sizeof(int)*2);
    }
    heap->items[heap->size] = item;
    heapifyUp(heap, heap->size);
    heap->size++;
}

void pushStack(Heap* heap, int item) {
    pushHeap(heap, item);
    heapifyDown(heap, 0, heap->size - 1);
}

int popHeap(Heap* heap) {
    if (heap->size == 0) return INT_MIN;
    int item = heap->items[0];
    heap->items[0] = heap->items[heap->size - 1];
    heap->size--;
    heapifyDown(heap, 0, heap->size - 1);
    return item;
}

int popStack(Heap* heap) {
    if (heap->size == 0) return INT_MIN;
    int item = heap->items[0];
    for(int i = 0; i < heap->size - 1; i++){
        heap->items[i] = heap->items[i + 1];    
    }
    heap->size--;
    return item;
}

void heapifyUp(Heap* heap, int index) {
    if (index > 0) {
        int parentIndex = (index - 1) / 2;
        if (heap->items[parentIndex] < heap->items[index]) {
            swap(heap, parentIndex, index);
            heapifyUp(heap, parentIndex);
        }
    }
}

void heapifyDown(Heap* heap, int parentIndex, int childIndex) {
    int leftChildIndex = 2 * parentIndex + 1;
    int rightChildIndex = 2 * parentIndex + 2;

    if (leftChildIndex >= heap->size) {
        return;
    }

    if (rightChildIndex < heap->size && heap->items[rightChildIndex] > heap->items[leftChildIndex]) {
        leftChildIndex = rightChildIndex;
    }

    if (heap->items[parentIndex] <= heap->items[leftChildIndex]) {
        return;
    }
    swap(heap, parentIndex, leftChildIndex);
    heapifyDown(heap, leftChildIndex, 2 * leftChildIndex + 1);
}

void swap(Heap* heap, int index1, int index2) {
    int temp = heap->items[index1];
    heap->items[index1] = heap->items[index2];
    heap->items[index2] = temp;
}
```