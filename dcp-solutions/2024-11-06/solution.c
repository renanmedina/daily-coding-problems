```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char** breakStringIntoLines(char* s, int k) {
    if (strlen(s) == 0 || k <= 1) return NULL;
    
    char* words[slen(s) + 1]; // Add one to account for null-terminator
    int wordCount = 0, lineLength = 0, start = 0;

    for (int i = 0; s[i] != '\0'; ++i) {
        if (s[i] == ' ') {
            words[wordCount++] = &s[start];
            start = i + 1;
        }
    }

    // Last word
    words[wordCount++] = &s[start];

    int resultLines = 1, wordIndex = 0;

    while (wordIndex < wordCount) {
        if (lineLength + strlen(words[wordIndex]) <= k) {
            lineLength += strlen(words[wordIndex]);
            ++wordIndex;
        } else {
            resultLines++;
            lineLength = strlen(words[wordIndex]);
            ++wordIndex;
        }
    }

    if (resultLines == 1 && lineLength > k) return NULL;

    char** result = malloc(resultLines * sizeof(char*));
    for (int i = 0; i < resultLines; ++i)
        result[i] = malloc(strlen(words[i]) + 1);

    for (int i = 0; i < wordCount; ++i) {
        if (i == 0 || words[i - 1][strlen(words[i - 1]) - 1] != ' ')
            strncpy(result[i], words[i], strlen(words[i]));
        else
            strncpy(result[i], words[i] + 1, strlen(words[i]) - 1);
        result[i][strlen(result[i])] = '\0';
    }

    return result;
}

void freeResult(char** result) {
    for (int i = 0; i < strlen(result); ++i)
        free(result[i]);
    free(result);
}
```