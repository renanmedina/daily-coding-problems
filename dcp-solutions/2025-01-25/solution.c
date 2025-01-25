```c
#include <stdio.h>

typedef struct {
    int* bits;
    int size;
} BitArray;

BitArray* init(int size) {
    BitArray* bitArray = (BitArray*) malloc(sizeof(BitArray));
    if (!bitArray) {
        return NULL;
    }
    
    bitArray->bits = (int*) calloc(size, sizeof(int));
    if (!bitArray->bits) {
        free(bitArray);
        return NULL;
    }
    bitArray->size = size;
    
    for (int i = 0; i < size; ++i) {
        bitArray->bits[i] = 0;
    }
    
    return bitArray;
}

void set(BitArray* bitArray, int index, int val) {
    if (val == 1 || val == 0) {
        bitArray->bits[index] = val;
    } else {
        printf("Invalid value. Value should be either 0 or 1.\n");
    }
}

int get(BitArray* bitArray, int index) {
    return bitArray->bits[index];
}
```