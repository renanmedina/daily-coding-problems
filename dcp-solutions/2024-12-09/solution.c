```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int uniformRandomNotInList(int n, int* l) {
    int total = 0;
    for (int i = 0; i <= n; i++) {
        total += 1;
    }

    while (1) {
        int num = rand() % total;

        int count = 0;
        for (int i = 0; i < n; i++) {
            if (l[i] == num)
                count++;
        }
        count++;

        if (count != 1) {
            return num;
        }
    }
}
```