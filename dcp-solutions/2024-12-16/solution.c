```c
#include <stdio.h>
#include <stdlib.h>

typedef struct MapEntry {
    int key;
    int value;
    int time;
} MapEntry;

typedef struct Map {
    MapEntry* entries;
    int size;
} Map;

Map* newMap() {
    Map* map = (Map*) malloc(sizeof(Map));
    map->entries = NULL;
    map->size = 0;
    return map;
}

void set(Map* map, int key, int value, int time) {
    if (map->entries == NULL || map->entries[map->size].time <= time) {
        MapEntry* newEntry = (MapEntry*) malloc(sizeof(MapEntry));
        newEntry->key = key;
        newEntry->value = value;
        newEntry->time = time;
        map->entries = realloc(map->entries, (map->size + 1) * sizeof(MapEntry));
        map->entries[map->size] = *newEntry;
        map->size++;
    } else {
        for (int i = map->size - 1; i >= 0; i--) {
            if (map->entries[i].time < time) {
                MapEntry* newEntry = (MapEntry*) malloc(sizeof(MapEntry));
                newEntry->key = key;
                newEntry->value = value;
                newEntry->time = time;
                map->entries[i + 1] = *newEntry;
                map->entries[i].time = time;
            } else if (map->entries[i].key == key) {
                map->entries[i].value = value;
                map->entries[i].time = time;
            }
        }
    }
}

int get(Map* map, int key, int time) {
    for (int i = 0; i < map->size; i++) {
        if (map->entries[i].key == key && map->entries[i].time >= time) {
            return map->entries[i].value;
        }
    }
    return -1; // return -1 to indicate the value is not found
}
```