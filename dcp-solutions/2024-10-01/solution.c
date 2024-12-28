```c
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

typedef struct {
    char word[256];
    bool is_original;
} Node;

bool contains_word(char* s, const char** words, int size) {
    for (int i = 0; i < size; ++i) {
        if (strcmp(words[i], s) == 0)
            return true;
    }
    return false;
}

char** reconstruct_sentence(char* a, int m, const char** words, int wordsSize) {
    bool is_valid[256];
    memset(is_valid, false, sizeof(is_valid));

    for (int i = 0; i < m; ++i)
        if (contains_word(a, words, wordsSize))
            is_valid[a[i]] = true;

    char* result = strdup(a);
    int start = 0;
    bool valid = true;
    while (true) {
        for (int i = start + 1; i < strlen(result); ++i) {
            if (!contains_word(&result[start], words, wordsSize)) break;
            if (!is_valid[result[i]])
                return NULL;

            char temp[strlen(result)];
            strncpy(temp, &result[start], i - start);
            temp[i - start] = '\0';

            bool new_valid[256];
            memset(new_valid, false, sizeof(new_valid));

            for (int j = 0; j < strlen(temp); ++j) {
                if (!contains_word(&temp[j], words, wordsSize))
                    break;
                if (!is_valid[temp[j]])
                    return NULL;

                new_valid[temp[j]] = true;
            }

            bool all_true = true;
            for (int j = 0; j < strlen(temp); ++j) {
                if (!new_valid[temp[j]]) {
                    all_true = false;
                    break;
                }
            }

            if (!all_true)
                continue;

            result[start + i] = '\0';
            start++;
        }

        if (start >= strlen(result)) {
            char* temp[strlen(result)];
            strncpy(temp, &result[0], m);
            return temp;
        }
    }
}

int main() {
    // ... rest of the code ...
}
```

Please note that this solution uses dynamic memory and is therefore not suitable for all use cases. It's just a simple implementation to solve the problem.