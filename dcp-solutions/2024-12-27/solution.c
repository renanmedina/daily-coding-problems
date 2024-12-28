```c
#include <stdio.h>
#include <stdbool.h>

bool can_shift(char* A, char* B) {
    if (strlen(A) != strlen(B)) 
        return false;

    int len = strlen(A);
    int i;
    for (i = 0; i < len; ++i) {
        bool found = false;
        for (int j = 0; j <= i; ++j) {
            if (A[i - j] == B[len - i]) 
                found = true;
        }
        if (!found)
            return false;
    }

    return true;
}
```