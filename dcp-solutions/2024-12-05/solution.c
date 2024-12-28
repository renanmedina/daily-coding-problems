```c
#include <stdio.h>
#include <stack>

int minRemoveToMakeValid(char* s) {
    int n = 0, open_parens = 0;
    stack<char> parens;

    for (char* p = s; *p != '\0'; ++p) {
        if (*p == '(') 
            open_parens++;
        else if (!open_parens)
            open_parens--;
        else
            parens.push(*p);
    }

    int to_remove = 0;
    while (parens.size()) {
        if (s[parens.top()] == ')') {
            parens.pop();
            to_remove++;
        } else 
            parens.pop();
    }
    to_remove += open_parens;

    return to_remove;
}
```