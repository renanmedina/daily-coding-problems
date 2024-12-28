```c
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int numElements;
    long long* elements;
} Stream;

void add(Stream* stream, int element) {
    if (stream->numElements == 0) {
        stream->elements = malloc(sizeof(long long));
        stream->elements[0] = element;
        stream->numElements++;
    } else {
        long long* new_elements = realloc(stream->elements, (stream->numElements + 1) * sizeof(long long));
        new_elements[stream->numElements] = element;
        free(stream->elements);
        stream->elements = new_elements;
        stream->numElements++;
    }
}

long long pickRandomElement(Stream* stream) {
    if (stream->numElements == 0) return -1;

    int sum = 0;
    for (int i = 0; i < stream->numElements; i++) {
        sum += stream->elements[i];
    }

    double randomDouble = (double)rand() / RAND_MAX;

    int lowerBound = 0, upperBound = stream->numElements - 1;
    while (upperBound - lowerBound > 1) {
        int mid = (lowerBound + upperBound) / 2;
        if (randomDouble * sum < (long long)(mid + 1) * stream->elements[mid]) {
            upperBound = mid;
        } else {
            lowerBound = mid;
        }
    }

    return stream->elements[upperBound];
}

int main() {
    srand(time(NULL));
    Stream stream;
    stream.numElements = 0;

    add(&stream, 1);
    add(&stream, 2);
    add(&stream, 3);

    printf("%d\n", pickRandomElement(&stream));

    return 0;
}
```