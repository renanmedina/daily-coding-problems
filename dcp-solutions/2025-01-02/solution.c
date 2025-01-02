```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* reverse_words_in_string(char *s, char delimiters[]) {
    // find first delimiter
    int i = 0;
    while (delimiters[i] && s[i]) i++;
    
    // split string into words around delimiters
    char** tokens = malloc((strlen(s) + 1) * sizeof(char*));
    int token_count = 0;
    for (; s[i]; i++) {
        if (!delimiters[i % strlen(delimiters)]) {
            while (s[i] && !delimiters[i % strlen(delimiters)]) i++;
            tokens[token_count++] = malloc(i - (i-1) + 2);
            strncpy(tokens[token_count - 1], s + (i-1), i - (i-1));
            tokens[token_count - 1][i-(i-1)] = '\0';
        }
    }

    // reverse each token
    int j;
    for (j = 0; j < token_count; j++) {
        char *start = tokens[j];
        char *end = start + strlen(start) - 1;

        while (start <= end) {
            char temp = *start;
            *start = *end;
            *end = temp;
            start++;
            end--;
        }
    }

    // reassemble string
    int j, k, m;
    for (j = 0; j < token_count; j++) {
        if (!tokens[j]) continue;

        char* result = malloc(token_count * sizeof(char*) + strlen(tokens[j]) + 2);
        k = 0;
        for (m = 0; m < token_count; m++) {
            if (k >= strlen(result)) {
                result[k] = '\0';
                break;
            }

            if (tokens[m]) {
                strncpy(&result[k], tokens[m], strlen(tokens[m]));
                result[k+strlen(tokens[m])] = '\0';
            }
            k += strlen(tokens[m]) + 1;
        }

        if (!result) free(tokens[j]); 
        else {
            strcpy(result, start);
            j--;
            break;
        }
    }

    for (k = 0; k < token_count; k++) free(tokens[k]);
    free(tokens);

    return result;
}
```