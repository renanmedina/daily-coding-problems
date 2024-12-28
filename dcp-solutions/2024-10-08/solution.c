```c
#include <stdio.h>
#include <string.h>

// Function to apply run-length encoding
void rle_encode(char* str, int len, char** encoded) {
    if (str == NULL || *encoded == NULL) return;

    int i = 0;
    while (i < len) {
        int count = 1;
        char c = str[i];
        while (i + 1 < len && str[i] == str[i+1]) {
            ++i;
            ++count;
        }
        (*encoded)++;
        (*encoded += 2);
        (*encoded)[0] = c;
        (*encoded)[1] = count;
    }
}

// Function to apply run-length decoding
void rle_decode(char* encoded, int len) {
    if (encoded == NULL || len < 3) return;

    char str[len];
    for (int i = 0; i < len-2; i += 3) {
        int count = (*encoded)[1];
        char c = (*encoded)[0];
        while (count--) {
            *(str+i) = c;
        }
    }

    *str = '\0';
}
```