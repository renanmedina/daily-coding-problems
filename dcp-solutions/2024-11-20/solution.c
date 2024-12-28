```c
#include <stdlib.h>

int rand5() {
    int x = rand7();
    while (x > 5) {
        x = rand7();
    }
    return x;
}
```