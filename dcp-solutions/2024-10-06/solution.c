```c
#include <stack>
#include <string.h>

bool is_valid(const char* s) {
    int n = strlen(s);
    int count = 0;
    const char *brackets = "{[(";
    const char *close_brackets = ")]}}";

    for (int i = 0; i < n; ++i) {
        if (s[i] == '(' || s[i] == '{' || s[i] == '[') {
            count++;
        } else {
            int idx = 0;
            while (brackets[idx] != s[i]) {
                idx++;
            }
            if (count - (s[i] == ')' ? 1 : (s[i] == '}' ? 2 : 3)) < 0) {
                return false;
            }
            count -= 3;
        }
    }

    if (count % 2 == 0) {
        return true;
    } else {
        return false;
    }
}
```