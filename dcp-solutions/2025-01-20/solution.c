### HitCounter Class Implementation
```c
#include <stdio.h>
#include <stdlib.h>

// Define a structure to hold timestamp and hits count for each minute
typedef struct {
    int timestamp;
    int hits;
} MinuteData;

// Structure to store all the minutes data
typedef struct {
    MinuteData* data;
    size_t size;
    size_t capacity;
} HitCounterData;

class HitCounter {
private:
    HitCounterData* data;

public:
    // Initialize a new hit counter
    HitCounter() {
        int size = 31; // Assuming one hour of data
        data = malloc(sizeof(HitCounterData));
        data->data = malloc(size * sizeof(MinuteData));
        data->size = 0;
        data->capacity = size;
    }

    // Record a hit at the given timestamp
    void record(int timestamp) {
        int index = timestamp % (data->capacity * 60); // Calculate index for minute-level storage

        if (index >= data->size) {
            // Resize data array as needed
            int newSize = (data->size + data->capacity) / 2;
            MinuteData* newData = realloc(data->data, newSize * sizeof(MinuteData));
            data->data = newData;
            data->capacity /= 2;

            while (index >= data->size) {
                data->size++;
            }
        }

        // Set timestamp and increment hits count for given minute
        data->data[index].timestamp = timestamp;
        data->data[index].hits += 1;
    }

    // Returns total number of hits recorded
    int total() {
        return data->size * data->data[0].hits; // Since all minutes are currently available in the last index.
    }

    // Returns number of hits that occurred between lower and upper timestamps (inclusive)
    int range(int lower, int upper) {
        int result = 0;

        for (int i = 0; i < data->size; i++) {
            if (data->data[i].timestamp <= upper && data->data[i].timestamp >= lower) {
                result += data->data[i].hits;
            }
        }

        return result;
    }
};
```

### HitCounter Memory Optimization for Limited Memory
```c
#include <stdio.h>
#include <stdlib.h>

class HitCounter {
private:
    int* hits; // For storing total hits count at each minute (1 hour)
    int size;

public:
    // Initialize a new hit counter with limited memory
    HitCounter(int maxDataSize) {
        size = 0;
        hits = malloc(maxDataSize * sizeof(int));
    }

    // Record a hit at the given timestamp
    void record(int timestamp) {
        if (size >= 1 << 10) { // Limit to store up to 1 hour of data for optimization
            // No more storage available
            return;
        }

        hits[size] = 1; // Set and increment the hits count at the given minute

        size++;
    }

    // Returns total number of hits recorded
    int total() {
        int result = 0;

        for (int i = 0; i < size; i++) {
            result += hits[i];
        }

        return result;
    }

    // Returns number of hits that occurred between lower and upper timestamps (inclusive)
    int range(int lower, int upper) {
        if (lower > upper) { // Invalid input
            return 0;
        }

        int result = 0;

        for (int i = lower; i <= upper; i++) {
            result += hits[i];
        }

        return result;
    }
};
```
### Optimization Code in C Language